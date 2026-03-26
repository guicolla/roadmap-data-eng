# Prompt para Portfolio — Projeto 08: Airflow DAG

Abra o [Claude](https://claude.ai) (gratuito) e cole o prompt abaixo.

---

## Prompt

```
Acesse o código de referência deste projeto de Airflow:
https://github.com/guicolla/roadmap-data-eng/tree/main/projetos/08-airflow-dag/solucao

Com base nesse exemplo, gere um index.html interativo para meu portfolio de Data Engineering.

O HTML deve visualizar a DAG do Airflow com:

1. Header com título e badges (Airflow, Python, Docker, DAGs)
2. Grafo visual da DAG:
   - 4 nodes: check_file → extract → transform → load
   - Setas de dependência entre eles
   - Ao clicar num node, mostra: operator usado, código Python da task, logs mockados
   - Status colorido (verde=sucesso, amarelo=rodando, cinza=pendente)
3. Botão "Executar DAG" que simula a execução:
   - Tasks mudam de cinza → amarelo → verde sequencialmente com delay
   - Logs aparecem em tempo real no painel lateral
4. Timeline de execução mostrando duração de cada task
5. Painel de configuração: schedule, retries, start_date
6. Seção "O que aprendi"
7. Footer

REQUISITOS TÉCNICOS:
- HTML único, responsivo, pronto para GitHub Pages
- Tema escuro, moderno
- Animação de execução da DAG (tasks mudando de cor)
- Logs simulados com timestamps
- Funcionar sem dependências externas (apenas Google Fonts via CDN)
```

---

## Como usar

1. Abra [claude.ai](https://claude.ai)
2. Cole o prompt acima
3. Personalize com a SUA DAG
4. Salve como `index.html`, publique via GitHub Pages
