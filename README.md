# Réseau Multi-Nœuds (Cloud & Edge Infrastructure)

Ce projet définit une architecture de réseau multi-nœuds conteneurisée utilisant **Docker** et **Docker Compose**. Il simule un environnement hybride combinant un nœud **Cloud** central et des nœuds **Edge** distribués.

---

## Architecture du Projet

* **Cloud Node (`Dockerfile.cloud`)** : Traitement centralisé, analyse des données et stockage principal.
* **Edge Node (`Dockerfile.edge`)** : Collecte des données locales, prétraitement et transmission au nœud Cloud.
* **Docker Compose (`docker-compose.yml`)** : Orchestration et gestion du réseau virtuel entre les nœuds.

---

## Lancement du projet

Pour construire et lancer l'ensemble des conteneurs :

```bash
docker-compose up --build -d