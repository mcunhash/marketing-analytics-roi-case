# Marketing Analytics – ROI de Campanhas

Este repositório contém as consultas SQL desenvolvidas para um case de Marketing Analytics
com foco na análise de ROI de campanhas e performance por canal e tipo de público.

O objetivo do case é avaliar a eficiência dos investimentos em mídia, identificar
alavancas de otimização e gerar recomendações baseadas em dados.

---

## Escopo da Análise

- Análise de ROI por campanha
- Avaliação da evolução trimestral do ROI por canal
- Comparação de performance entre público quente e público frio
- Geração de insights para otimização de investimento em mídia

---

## Stack Utilizada

- BigQuery (GCP)
- SQL
- VS Code
- Google Sheets (apoio à visualização)
- Python (pandas) para tratamento e padronização dos dados

---

## Estrutura do Repositório

sql/
├── load_raw.sql        # Consultas de carga e dados brutos
├── tabelas_analytics.sql    # Tratamento e regras de negócio
└── top 5 campanhas.sql      # Métricas finais e análises de ROI
└── dados campanha trimestre.sql      # Métricas finais e análises de ROI
└── perfil publico.sql    # Métricas finais e análises de ROI

python/
└── limpeza.py  # Limpeza e padronização dos arquivos CSV
