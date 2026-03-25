# Projeto 11 — Terraform — Infra como Codigo

> Provisione infraestrutura GCP com Terraform

## Contexto

Infraestrutura como codigo (IaC) garante que seu ambiente e reproduzivel e versionado. Neste projeto, voce vai codificar em Terraform toda a infraestrutura do projeto anterior.

## Requisitos

1. Instalar Terraform e configurar o provider GCP
2. Criar bucket GCS via Terraform
3. Criar dataset BigQuery via Terraform
4. Criar service account com IAM policies
5. Usar variaveis e outputs
6. Entender terraform plan, apply e destroy
7. Gerenciar state (local ou remote)

## Criterios de Pronto

- [ ] terraform apply cria toda a infra sem erros
- [ ] terraform destroy limpa tudo
- [ ] Variaveis e outputs configurados
- [ ] State gerenciado corretamente

## Skills Praticadas

Terraform, HCL, GCP Provider, IAM, state management

## Entregavel — GitHub Pages

GitHub Pages com visualizacao do Terraform plan — recursos que serao criados, com diagrama da infra.

Use o arquivo `PROMPT.md` para gerar sua pagina de portfolio para este projeto.

## Recursos

Acesse o [Roadmap Interativo](https://gc-data-academy.github.io/roadmap-data-engineering) e clique neste projeto para ver a lista completa de docs e videos recomendados.

## Estrutura

```
11-terraform-iac/
├── README.md        ← Voce esta aqui
├── PROMPT.md        ← Prompt para gerar o portfolio
├── solucao/         ← Codigo de referencia
└── dados/           ← Dados de exemplo
```

---

Feito com ☕ por [GC Data Academy](https://gc-data-academy.github.io/roadmap-data-engineering)
