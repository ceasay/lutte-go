# Utiliser l'image de base Go
FROM golang:1.20-alpine

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier go.mod et go.sum, puis télécharger les dépendances
COPY go.mod  ./
RUN go mod tidy

# Copier tous les fichiers sources Go dans le conteneur
COPY . .

# Copier le dossier "video" contenant la vidéo dans le conteneur
COPY video /app/video

# Compiler l'application Go
RUN go build -o main .

# Exposer le port sur lequel le serveur va écouter
EXPOSE 8080

# Commande pour exécuter l'application
CMD ["./main"]

