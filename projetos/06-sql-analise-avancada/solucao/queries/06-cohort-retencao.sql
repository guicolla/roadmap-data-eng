-- Q6: Análise de cohort — retenção de ouvintes por mês
-- Conceito: CTE complexa + auto-join + DATE functions

WITH primeiro_stream AS (
    SELECT 
        usuario_id,
        STRFTIME('%Y-%m', MIN(played_at)) AS cohort_mes
    FROM streams
    GROUP BY usuario_id
),
atividade_mensal AS (
    SELECT DISTINCT
        s.usuario_id,
        STRFTIME('%Y-%m', s.played_at) AS mes_ativo
    FROM streams s
),
cohort_data AS (
    SELECT 
        ps.cohort_mes,
        am.mes_ativo,
        COUNT(DISTINCT am.usuario_id) AS usuarios_ativos
    FROM primeiro_stream ps
    JOIN atividade_mensal am ON ps.usuario_id = am.usuario_id
    GROUP BY ps.cohort_mes, am.mes_ativo
),
cohort_tamanho AS (
    SELECT cohort_mes, COUNT(*) AS tamanho
    FROM primeiro_stream
    GROUP BY cohort_mes
)
SELECT 
    cd.cohort_mes,
    ct.tamanho AS usuarios_iniciais,
    cd.mes_ativo,
    cd.usuarios_ativos,
    ROUND(cd.usuarios_ativos * 100.0 / ct.tamanho, 1) AS retencao_pct
FROM cohort_data cd
JOIN cohort_tamanho ct ON cd.cohort_mes = ct.cohort_mes
ORDER BY cd.cohort_mes, cd.mes_ativo;
