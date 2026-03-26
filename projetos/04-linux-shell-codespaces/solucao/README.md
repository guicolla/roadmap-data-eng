# Solução — Projeto 04: Linux + Shell Scripting

Este é o passo a passo completo. Se você quer tentar sozinho, volte para o [README do projeto](../README.md).

---

## Passo 1 — Abrir o Codespace

1. No GitHub, vá no seu repo do projeto
2. Clique **"Code"** → **"Codespaces"** → **"Create codespace on main"**
3. Aguarde o ambiente carregar (~30s)
4. O terminal já está pronto na parte inferior do VS Code

## Passo 2 — Praticar comandos Linux

Antes dos scripts, pratique os comandos básicos. Copie e cole no terminal:

```bash
# Navegação
pwd
ls -la
mkdir teste && cd teste && pwd
cd ..

# Criar e manipular arquivos
touch arquivo.txt
echo "Hello World" > arquivo.txt
cat arquivo.txt
cp arquivo.txt copia.txt
mv copia.txt renomeado.txt
ls
rm renomeado.txt arquivo.txt
rmdir teste

# Grep — buscar texto
echo -e "erro no servidor\ntudo ok\nerro de conexão\nsucesso" > log.txt
grep "erro" log.txt
grep -c "erro" log.txt
grep -n "erro" log.txt
rm log.txt

# Permissões
touch script.sh
ls -la script.sh
chmod +x script.sh
ls -la script.sh
rm script.sh
```

## Passo 3 — Dar permissão e rodar os scripts

```bash
cd solucao/scripts
chmod +x setup.sh backup.sh processa.sh
```

### Script 1 — Setup
```bash
./setup.sh
```
Cria pastas, instala ferramentas e configura variáveis.

### Script 2 — Backup
```bash
# Fazer backup da pasta de dados
./backup.sh ../../dados
```
Compacta os CSVs em .tar.gz com data no nome.

### Script 3 — Processamento
```bash
# Processar todos os CSVs
./processa.sh ../../dados
```
Lista cada CSV, mostra preview e gera relatório.

## Passo 4 — Gerar a GitHub Pages

Siga o [PROMPT.md](../PROMPT.md).

## Passo 5 — Commitar e publicar

```bash
git add .
git commit -m "feat: comandos Linux e scripts Bash para automacao"
git push origin main
```

## ✅ Checklist Final

- [ ] Codespace funcionando
- [ ] Sabe navegar, criar/mover/remover arquivos
- [ ] Sabe usar grep, chmod, ps
- [ ] 3 scripts funcionando (setup, backup, processa)
- [ ] Scripts têm tratamento de erros e logs
- [ ] GitHub Pages com guia interativo

---

Próximo projeto: [05 — Python ETL de API](../../05-python-etl-api/)
