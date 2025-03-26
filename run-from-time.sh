#!/bin/bash

# Função de ajuda
usage() {
    echo "Uso: $0 --command \"comando\" [--count numero] --temp segundos"
    echo "  --command: Comando a ser executado (obrigatório)"
    echo "  --count: Número de execuções (padrão: loop infinito)"
    echo "  --temp: Intervalo em segundos entre execuções (obrigatório)"
    exit 1
}

# Variáveis padrão
command=""
count=""
temp=""

# Processa os parâmetros
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --command=*)
            command="${1#*=}"
            shift
            ;;
        --command)
            command="$2"
            shift 2
            ;;
        --count=*)
            count="${1#*=}"
            shift
            ;;
        --count)
            count="$2"
            shift 2
            ;;
        --temp=*)
            temp="${1#*=}"
            shift
            ;;
        --temp)
            temp="$2"
            shift 2
            ;;
        *)
            usage
            ;;
    esac
done

# Validações
[ -z "$command" ] && echo "Erro: --command é obrigatório" && exit 1
[ -z "$temp" ] && echo "Erro: --temp é obrigatório" && exit 1
! [[ "$temp" =~ ^[0-9]+$ ]] && echo "Erro: --temp deve ser numérico" && exit 1
if [ ! -z "$count" ]; then
    ! [[ "$count" =~ ^[0-9]+$ ]] && echo "Erro: --count deve ser numérico" && exit 1
fi

# Execução do comando
if [ -z "$count" ]; then
    # Loop infinito
    while true; do
        eval "$command"
        sleep "$temp"
    done
else
    # Loop controlado por contador
    contador=0
    while [ $contador -lt "$count" ]; do
        eval "$command"
        contador=$((contador + 1))
        [ $contador -lt "$count" ] && sleep "$temp"
    done
fi
