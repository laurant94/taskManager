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

# ----------------------------------------------







# Deployement d'application sur heroku

1.  Créer une application heroku dans le répertoire du projet avec la commande
    > ` heroku create `
2. Précompilé les actifs avec la commande
    > `rails assets:precompile RAILS_ENV=production`
3. Commenter la version Ruby dans le Gemfile si heroku-20 est utilisé
4. Exécuter `bundle install` pour mettre à jour les dépendances
5. Executer les commandes suivantes pour valiider le git
    > `git add -A`
    > `git commit -m "my-first-commit"`
6. Ajouter le buildpack Heroku avec les commandes
    > `heroku buildpacks:set heroku/ruby`
    > `heroku buildpacks:add --index 1 heroku/nodejs`
7. Deployer vers heroku avec
    > `git push heroku master`
8. Migrer la base de données avec 
    > `heroku run rails db:migrate`

### fin du deployement