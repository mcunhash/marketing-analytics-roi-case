import pandas as pd
import os

# --- Caminho completo do arquivo original e limpo ---
SALES_ORIGINAL_CSV = r'c:\Users\mhenr\Downloads\vendas.csv'
SALES_CLEANED_CSV = r'c:\Users\mhenr\Downloads\vendas_cleaned.csv'

# --- Processamento do vendas.csv ---
print(f"Processando '{SALES_ORIGINAL_CSV}' localmente...")
try:
    # Ler o CSV. O pandas é inteligente para lidar com colunas extras e vazias aqui,
    # especialmente se você só selecionar as que precisa depois.
    df_sales = pd.read_csv(SALES_ORIGINAL_CSV)

    # Selecionar apenas as colunas relevantes e converter datas/tipos
    # Isso automaticamente descarta as colunas _1, _2, _3, _4 e a coluna vazia
    df_sales_cleaned = pd.DataFrame({
        'order_date': pd.to_datetime(df_sales['order_date'], format='%d/%m/%Y', errors='coerce').dt.strftime('%Y-%m-%d'),
        'campaign_id': df_sales['campaign_id'],
        'revenue': df_sales['revenue'].astype('float64')
    })

    # Exibir as primeiras linhas do DataFrame processado (opcional)
    print("\nPrimeiras linhas de sales_cleaned (local):")
    print(df_sales_cleaned.head())

    # Salvar o DataFrame limpo localmente
    df_sales_cleaned.to_csv(SALES_CLEANED_CSV, index=False)
    print(f"Arquivo '{SALES_CLEANED_CSV}' salvo com sucesso localmente.")

except FileNotFoundError:
    print(f"ERRO: O arquivo '{SALES_ORIGINAL_CSV}' não foi encontrado na pasta atual.")
except Exception as e:
    print(f"ERRO ao processar '{SALES_ORIGINAL_CSV}': {e}")

print("\nProcessamento local concluído.")
print(f"Você pode agora fazer o upload de '{SALES_CLEANED_CSV}' para o seu bucket no Google Cloud Storage.")