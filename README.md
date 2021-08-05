# Task Manager

## fonctionalités

- Enrégitré un utlisateur
- Connecter un utilisateur
- L'utilisateur peut:
  - Enregistrer une tâche
  - Définir une date de fin de tâche
  - Donnée un niveau de priorité
  - Ajouter une status (En attente, en cours, terminée)
  - Trier par status, priorité ou par date de fin
  - Rechercher par nom
  - Afficher sous forme de liste
  - Donnée une étiquette à une tache
  - Voir que la liste de ses tâches



## Structure des tables

1. User

- **username**: string
- **email**: string
- **password_digest**: string
- **firstname**:string
- **lastname**: string
- **activated**: string
- **activation_token**: text

2. Task

- **title**: string
- **content**: text
- **end_date**: datetime
- **priority**: integer
- **state**: string
- **user_id**: string
- **tag_id**: string

3. Tag

- **name**: string
- **slug**: string
- **comment**: string
- **task_count**: string

# .