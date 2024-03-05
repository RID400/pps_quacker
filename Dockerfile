# Fase 1: Instalación de dependencias
FROM python:3.11-slim as builder

WORKDIR /app

COPY requirements.txt .

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Fase 2: Ejecución de la aplicación
FROM builder as runner

# Copiar todo, excepto lo especificado en .dockerignore
COPY . .

# Exponer el puerto necesario
EXPOSE 5000
# Comando para ejecutar la aplicación
CMD ["python", "app.py"]
