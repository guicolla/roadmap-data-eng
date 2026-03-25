"""
Agenda de Contatos — Python Básico
CRUD completo com persistência em JSON.

Uso:
    python agenda.py

Autor: GC Data Academy
"""

import json
import os

ARQUIVO = "contatos.json"


def carregar_contatos() -> list[dict]:
    """Carrega contatos do arquivo JSON. Retorna lista vazia se não existir."""
    if os.path.exists(ARQUIVO):
        with open(ARQUIVO, "r", encoding="utf-8") as f:
            return json.load(f)
    return []


def salvar_contatos(contatos: list[dict]) -> None:
    """Salva a lista de contatos no arquivo JSON."""
    with open(ARQUIVO, "w", encoding="utf-8") as f:
        json.dump(contatos, f, indent=2, ensure_ascii=False)


def adicionar_contato(contatos: list[dict]) -> None:
    """Adiciona um novo contato à lista."""
    print("\n--- Adicionar Contato ---")
    
    nome = input("Nome: ").strip()
    if not nome:
        print("❌ Erro: nome não pode ser vazio.")
        return
    
    # Verificar se já existe
    for c in contatos:
        if c["nome"].lower() == nome.lower():
            print(f"❌ Erro: contato '{nome}' já existe.")
            return
    
    telefone = input("Telefone: ").strip()
    if not telefone:
        print("❌ Erro: telefone não pode ser vazio.")
        return
    
    email = input("Email: ").strip()
    if email and "@" not in email:
        print("❌ Erro: email inválido (precisa ter @).")
        return
    
    contato = {
        "nome": nome,
        "telefone": telefone,
        "email": email if email else "N/A"
    }
    
    contatos.append(contato)
    salvar_contatos(contatos)
    print(f"✅ Contato '{nome}' adicionado com sucesso!")


def listar_contatos(contatos: list[dict]) -> None:
    """Lista todos os contatos."""
    print("\n--- Lista de Contatos ---")
    
    if not contatos:
        print("📭 Nenhum contato cadastrado.")
        return
    
    print(f"{'#':<4} {'Nome':<20} {'Telefone':<15} {'Email':<25}")
    print("-" * 64)
    
    for i, c in enumerate(contatos, 1):
        print(f"{i:<4} {c['nome']:<20} {c['telefone']:<15} {c['email']:<25}")
    
    print(f"\nTotal: {len(contatos)} contato(s)")


def buscar_contato(contatos: list[dict]) -> None:
    """Busca um contato por nome (busca parcial)."""
    print("\n--- Buscar Contato ---")
    
    termo = input("Digite o nome (ou parte): ").strip().lower()
    if not termo:
        print("❌ Erro: digite algo para buscar.")
        return
    
    resultados = [c for c in contatos if termo in c["nome"].lower()]
    
    if not resultados:
        print(f"🔍 Nenhum contato encontrado para '{termo}'.")
        return
    
    print(f"\n🔍 {len(resultados)} resultado(s) para '{termo}':\n")
    for c in resultados:
        print(f"  Nome:     {c['nome']}")
        print(f"  Telefone: {c['telefone']}")
        print(f"  Email:    {c['email']}")
        print()


def editar_contato(contatos: list[dict]) -> None:
    """Edita um contato existente."""
    print("\n--- Editar Contato ---")
    
    if not contatos:
        print("📭 Nenhum contato para editar.")
        return
    
    nome = input("Nome do contato a editar: ").strip().lower()
    
    for c in contatos:
        if c["nome"].lower() == nome:
            print(f"\nContato encontrado: {c['nome']}")
            print("(Pressione Enter para manter o valor atual)\n")
            
            novo_nome = input(f"  Nome [{c['nome']}]: ").strip()
            novo_tel = input(f"  Telefone [{c['telefone']}]: ").strip()
            novo_email = input(f"  Email [{c['email']}]: ").strip()
            
            if novo_nome:
                c["nome"] = novo_nome
            if novo_tel:
                c["telefone"] = novo_tel
            if novo_email:
                if "@" not in novo_email:
                    print("❌ Email inválido. Campo não alterado.")
                else:
                    c["email"] = novo_email
            
            salvar_contatos(contatos)
            print(f"✅ Contato atualizado com sucesso!")
            return
    
    print(f"❌ Contato '{nome}' não encontrado.")


def remover_contato(contatos: list[dict]) -> None:
    """Remove um contato da lista."""
    print("\n--- Remover Contato ---")
    
    if not contatos:
        print("📭 Nenhum contato para remover.")
        return
    
    nome = input("Nome do contato a remover: ").strip().lower()
    
    for i, c in enumerate(contatos):
        if c["nome"].lower() == nome:
            confirmacao = input(f"Tem certeza que deseja remover '{c['nome']}'? (s/n): ").strip().lower()
            if confirmacao == "s":
                removido = contatos.pop(i)
                salvar_contatos(contatos)
                print(f"🗑️ Contato '{removido['nome']}' removido.")
            else:
                print("Operação cancelada.")
            return
    
    print(f"❌ Contato '{nome}' não encontrado.")


def exibir_menu() -> None:
    """Exibe o menu principal."""
    print("\n╔══════════════════════════════╗")
    print("║     📒 AGENDA DE CONTATOS    ║")
    print("╠══════════════════════════════╣")
    print("║  1. Adicionar contato        ║")
    print("║  2. Listar contatos          ║")
    print("║  3. Buscar contato           ║")
    print("║  4. Editar contato           ║")
    print("║  5. Remover contato          ║")
    print("║  0. Sair                     ║")
    print("╚══════════════════════════════╝")


def main():
    """Loop principal do programa."""
    contatos = carregar_contatos()
    print(f"\n🚀 Agenda iniciada! {len(contatos)} contato(s) carregado(s).")
    
    while True:
        exibir_menu()
        opcao = input("\nEscolha uma opção: ").strip()
        
        if opcao == "1":
            adicionar_contato(contatos)
        elif opcao == "2":
            listar_contatos(contatos)
        elif opcao == "3":
            buscar_contato(contatos)
        elif opcao == "4":
            editar_contato(contatos)
        elif opcao == "5":
            remover_contato(contatos)
        elif opcao == "0":
            print("\n👋 Até mais! Contatos salvos.")
            break
        else:
            print("❌ Opção inválida. Tente novamente.")


if __name__ == "__main__":
    main()
