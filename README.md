# PROXY WINDOWS (cntlm, tor e delegate)

## Resumo:

Crie um arquivo `.env` na raiz do projeto, use como base o `.env.example` já disponível.

Para ligar o proxy e rodar configs:

1. Rodar `_config_init.bat`
2. Rodar `all_proxy_start.lnk`

Para retirar todas configs e desligar o proxy:

1. Rodar `_config_remove.bat`
2. Rodar `all_proxy_stop.lnk`

---

## Base: CNTLM

O objetivo inicial desses scripts era poder configurar um proxy usando o programa CNTLM, permitindo que se seja possível ferramentas de linha de comando com o git, PHP e composer sem receber mensagens de erro de proxy no Windows.

### Evolução: TOR e DELEGATE

Com a evolução da suite de scripts, foi acrescentada a opção de utilizar também o TOR (como proxy SOCKS, configurado sobre o CNTLM) e o DELEGATE (como proxy HTTP, configurado sobre o TOR).

Por padrão, os proxies respondem apenas em localhost (127.0.0.1), nas seguintes portas e protocolos:

| Ordem | Ferramenta | Porta | Protocolo  |
|-------|------------|-------|------------|
| #1    | cntlm      | 3128  | HTTP/HTTPS |
| #2    | tor        | 9150  | SOCKS5     |
| #3    | delegate   | 8118  | HTTP/HTTPS |

## Qual usar?

Talvez o CNTLM seja suficiente (na maioria das vezes ele é). Nesse caso, é necessário que apenas ele seja aberto (e você economizará uma série de configurações).

Se perceber que o CNTLM não é suficiente (por causa das regras de bloqueio do firewall/proxy da rede), aí você deve utilizar também o TOR, ou ainda o TOR + DELEGATE.

Caso seja necessário usar o TOR, é necessário abrir primeiro o CNTLM depois o TOR.

Caso seja necessário usar DELEGATE, é necessário abrir primeiro o CNTLM, depois o tor, depois o DELEGATE.

## CNTLM: Ligando

Para começar, você deve iniciar o CNTLM e carregar as configurações.

1. Proxy - Iniciar

Para iniciar o CNTLM, é só executar o arquivo `cntlm_start`.

2. Configs - Carregamento

Abra o Terminal bash (via git bash, CMDer, cygwin etc.)

Navegue até a pasta onde estão estes scripts:

```
cd "CAMINHO_DESTA_PASTA"
```

Carregue as configurações:

```
source cntlm_configs_load.sh
```

Depois disso, você já pode utilizar suas ferramentas de linha de comando através do CNTLM.

## CNTLM: Desligando

1. Configs - Limpeza

No Terminal bash que você está usando, execute:

```
cd "CAMINHO_DESTA_PASTA"
source cntlm_configs_unload.sh
```

2. Proxy - Encerrar

Para encerrar o CNTLM, é só fechar a janela do CMD onde ele foi iniciado.

## TOR: Ligando

1. Dependência - Iniciar

O TOR depende do CNTLM.

Para iniciar o CNTLM, é só executar o arquivo `cntlm_start`.

2. Proxy - Iniciar

Para iniciar o TOR, é só executar o arquivo `tor_start`.

3. Configs - Carregamento

Abra o Terminal bash (via git bash, CMDer, cygwin etc.)

Navegue até a pasta onde estão estes scripts:

```
cd "CAMINHO_DESTA_PASTA"
```

Carregue as configurações:

```
source tor_configs_load.sh
```

Com isso você já pode utilizar suas ferramentas através do TOR.

## TOR: Desligando

1. Configs - Limpeza

No Terminal bash que você está usando, execute:

```
cd "CAMINHO_DESTA_PASTA"
source tor_configs_unload.sh
```

2. Proxy - Encerrar

Execute o arquivo arquivo `tor_stop`.

3. Dependência - Encerrar

Para encerrar o CNTLM, é só fechar a janela do CMD onde ele foi iniciado.

## DELEGATE: Ligando

1. Dependência - Iniciar

O TOR depende do CNTLM e do TOR.

Para iniciar o CNTLM, é só executar o arquivo `cntlm_start`.

Para iniciar o TOR, é só executar o arquivo `tor_start`.

2. Proxy - Iniciar

Para iniciar o DELEGATE, é só executar o arquivo `delegate_start`.

3. Configs - Carregamento

Abra o Terminal bash (via git bash, CMDer, cygwin etc.)

Navegue até a pasta onde estão estes scripts:

```
cd "CAMINHO_DESTA_PASTA"
```

Carregue as configurações:

```
source delegate_configs_load.sh
```

Depois disso, você já pode utilizar suas ferramentas de linha de comando através do DELEGATE.

## DELEGATE: Desligando

1. Configs - Limpeza

No Terminal bash que você está usando, execute:

```
cd "CAMINHO_DESTA_PASTA"
source delegate_configs_unload.sh
```

2. Proxy - Encerrar

Para encerrar o DELEGATE, é só fechar a janela do CMD onde ele foi iniciado.

3. Dependências - Encerrar

Para encerrar o TOR, execute o arquivo arquivo `tor_stop`.

Para encerrar o CNTLM, é só fechar a janela do CMD onde ele foi iniciado.

## Changelog

### 2017-01-24

- Inclui `_config_init.bat` e `_config_remove.bat` para configurar a ferramenta pela primeira fez num diretório
- Permite rodar um arquivo bat (atalho do windows) que liga todos os proxies de uma vez
- Permite rodar um arquivo bat (atalho do windows) para desligar todos os proxies de uma vez
- Inclui .env para configuração da ferramenta (usar como base o .env.example)

### 2016-05-19

- Corrige falta de vários arquivos executáveis (problema no `gitignore`, dica do @jfeliperibeiro).

### 2016-05-11

- Adiciona tor_configs_load.sh e unload pois, conforme dica do @royopa, é em alguns casos é possível utilizar o TOR como proxy.
- Detalha mais as informações para quem for usar cada uma das ferramentas.
- mantém janela CMD aberta enquanto TOR estiver sendo executado
- troca PRIVOXY por DELEGATE (assim não é necessária mais GUI, tudo via CLI)

### 2016-05-10
- Adiciona possibilidade de usar, paralelamente ao CNTLM, os proxies via TOR e PRIVOXY.

### 2016-03-16
- Remove abertura de um novo bash após executar `cntlm_configs_load.sh`

### 2016-02-19
- Ajusta nomes links (proxy_start normal, non_interactive força padrões)

### 2016-02-18
- Remove necessidade do proxy_stop (fechando a janela, o cntlm encerra)
- Permite alterar, se necessário, as configurações CNTLM interativamente
- versão inicial do script
