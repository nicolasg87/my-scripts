#!/usr/bin/env bash

# Diretório de entrada para os arquivos .flac
input_dir="."

# Diretório de saída para os arquivos .opus
output_dir="./opus"

# Verifica se o diretório de saída existe, se não, cria
mkdir -p "$output_dir"

for flac_file in "$input_dir"/*.flac; do
    # Obtém o nome do arquivo sem a extensão
    base_name=$(basename "$flac_file" .flac)

    # Define o nome do arquivo de saída .opus
    opus_file="$output_dir/$base_name.opus"

    opusenc --bitrate 160 "$flac_file" "$opus_file"

    echo "Arquivo $flac_file convertido para $opus_file"
done

echo "Conversão concluída."

