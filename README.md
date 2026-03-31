<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=F5900D,111111&height=2&section=header" width="100%"/>
</p>

<h1 align="center">🛤️ Roadmap Data Engineering</h1>
<h3 align="center">Do Zero ao Pipeline em Produção — 12 Projetos Práticos</h3>

<p align="center">
  <a href="https://guicolla.github.io/roadmap-data-eng">
    <img src="https://img.shields.io/badge/🗺️_Roadmap_Interativo-F5900D?style=for-the-badge&logo=googlechrome&logoColor=white" alt="Roadmap"/>
  </a>
  <img src="https://img.shields.io/badge/Projetos-12-111111?style=for-the-badge" alt="12 projetos"/>
  <img src="https://img.shields.io/badge/Gratuito-Open_Source-22c55e?style=for-the-badge" alt="Free"/>
  <img src="https://img.shields.io/badge/Nível-Iniciante_→_Pleno-3B82F6?style=for-the-badge" alt="Nível"/>
</p>

<p align="center">
  <a href="#-sobre">Sobre</a> •
  <a href="#-como-usar">Como Usar</a> •
  <a href="#️-fases-e-projetos">Projetos</a> •
  <a href="#-portfolio">Portfolio</a> •
  <a href="#-gc-data-academy">Academy</a>
</p>

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=F5900D,111111&height=2&section=header" width="100%"/>
</p>

## 📌 Sobre

Este roadmap é um guia **prático e gratuito** para quem quer se tornar Data Engineer. Não é uma lista de links — são **12 projetos completos com código**, organizados em 3 fases progressivas.

**O diferencial:** cada projeto gera uma **GitHub Pages interativa** no seu perfil. Ao final dos 12 projetos, você terá um portfolio real de Data Engineer com demos funcionais que qualquer recrutador pode acessar.

**Para quem é:**
- Pessoas entrando na área de dados
- Analistas migrando para engenharia de dados
- Júniors que querem um portfolio sólido
- Qualquer pessoa que aprende melhor fazendo

## 🚀 Como Usar

### 1. Acesse o Roadmap Interativo

👉 **[guicolla.github.io/roadmap-data-eng](https://guicolla.github.io/roadmap-data-eng)**

O roadmap visual mostra todas as fases, projetos, skills e recursos. Você pode marcar projetos como concluídos e acompanhar seu progresso.

### 2. Escolha um projeto e leia o README

Cada pasta em `projetos/` tem:

| Arquivo | O que é |
|---------|---------|
| `README.md` | Enunciado completo — contexto, requisitos, critérios de "pronto" |
| `PROMPT.md` | Prompt pronto pra IA gerar sua página de portfolio pro projeto |
| `solucao/` | Código de referência completo e funcional |
| `dados/` | Dados de exemplo ou instruções de onde buscar |

### 3. Faça o projeto e publique

1. Crie um repo no seu GitHub para o projeto
2. Desenvolva seguindo o README
3. Use o `PROMPT.md` para gerar uma GitHub Pages bonita
4. Publique e adicione ao seu portfolio

> 💡 **Dica:** Tente fazer sozinho primeiro. Use a pasta `solucao/` só se travar.

## 🗺️ Fases e Projetos

### Fase 1 — Fundamentos `~2 meses`

| # | Projeto | Skills | Status |
|---|---------|--------|--------|
| 01 | [Git + GitHub Pages](projetos/01-git-github-pages/) | Git, GitHub, HTML, Prompt IA | 🟢 Disponível |
| 02 | [Python — Agenda de Contatos](projetos/02-python-agenda-contatos/) | Python, JSON, CRUD, CLI | 🟢 Disponível |
| 03 | [SQL — Primeiras Queries](projetos/03-sql-primeiras-queries/) | SQL, SQLite, SELECT, Filtros | 🟢 Disponível |
| 04 | [Linux + Shell Scripting](projetos/04-linux-shell-codespaces/) | Linux, Bash, Shell, Codespaces | 🟢 Disponível |
| 05 | [Python — ETL de API](projetos/05-python-etl-api/) | Python, requests, pandas, JSON | 🟢 Disponível |

### Fase 2 — Core Data Engineering `~2 meses`

| # | Projeto | Skills | Status |
|---|---------|--------|--------|
| 06 | [SQL — Análise Avançada](projetos/06-sql-analise-avancada/) | SQL, CTEs, Window Functions | 🟢 Disponível |
| 07 | [Docker — Stack Containerizada](projetos/07-docker-stack/) | Docker, Compose, Dockerfile | 🟢 Disponível |
| 08 | [Airflow — Primeira DAG](projetos/08-airflow-dag/) | Airflow, Python, DAGs | 🟢 Disponível |
| 09 | [dbt — Transformações e Testes](projetos/09-dbt-transformacoes/) | dbt, SQL, Testes, Docs | 🟢 Disponível |

### Fase 3 — Cloud & Produção `~2 meses`

| # | Projeto | Skills | Status |
|---|---------|--------|--------|
| 10 | [GCP — BigQuery](projetos/10-gcp-bigquery/) | BigQuery, GCS, IAM | 🟢 Disponível |
| 11 | [Terraform — IaC](projetos/11-terraform-iac/) | Terraform, GCP Provider | 🟢 Disponível |
| 12 | [Pipeline Cloud Completo](projetos/12-pipeline-cloud/) | GCP, Composer, dbt, BQ, Terraform | 🟢 Disponível |

## 🎨 Portfolio

A ideia central deste roadmap é que seu **portfolio cresce junto com você**:

```
Projeto 01 → Cria o portfolio (GitHub Pages no ar)
Projeto 02 → Adiciona página do ETL com dashboard interativo
Projeto 03 → Adiciona SQL Explorer com queries rodáveis
...
Projeto 12 → Portfolio completo com 12 demos interativas
```

Cada `PROMPT.md` contém um prompt otimizado para você colar no ChatGPT ou Claude e gerar uma página HTML profissional para aquele projeto, seguindo a identidade visual do seu portfolio.

## 📂 Estrutura do Repositório

```
roadmap-data-eng/
├── index.html                          ← Roadmap interativo (GitHub Pages)
├── README.md                           ← Você está aqui
├── projetos/
│   ├── 01-git-github-pages/
│   │   ├── README.md                   ← Enunciado
│   │   ├── PROMPT.md                   ← Prompt para gerar portfolio
│   │   ├── solucao/                    ← Código completo
│   │   └── dados/                      ← Dados de exemplo
│   ├── 02-python-agenda-contatos/
│   ├── 03-sql-primeiras-queries/
│   ├── 04-linux-shell-codespaces/
│   ├── 05-python-etl-api/
│   ├── 06-sql-analise-avancada/
│   ├── 07-docker-stack/
│   ├── 08-airflow-dag/
│   ├── 09-dbt-transformacoes/
│   ├── 10-gcp-bigquery/
│   ├── 11-terraform-iac/
│   └── 12-pipeline-cloud/
```

## 🎓 GC Data Academy

Este roadmap é um recurso gratuito da **GC Data Academy**.

Quer ir além? Na Academy você pratica com **desafios semanais**, recebe **feedback**, e compete no **ranking** com outros engenheiros de dados.

👉 **[Conhecer a GC Data Academy](#)**

## 🤝 Contribuindo

Encontrou um erro? Tem uma sugestão de recurso? Abra uma [issue](../../issues) ou envie um PR.

## 📜 Licença

Este projeto é open source sob a licença [MIT](LICENSE).

---

<p align="center">
  Feito por <a href="https://www.linkedin.com/in/guilherme-colla/">Guilherme Colla</a> — <a href="https://gcdatac.com">GC Data</a>
</p>

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=F5900D,111111&height=2&section=header" width="100%"/>
</p>
