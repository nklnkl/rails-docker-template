# Rails API Docker Template

This repository contains a template for developing a Ruby on Rails API using Docker. It's set up with PostgreSQL as the database and JWT authentication via Devise.

## Development Environment

- Ruby version: 3.3.5
- Rails version: 8.0.0
- Database: PostgreSQL 13
- Authentication: Devise with JWT

## Prerequisites

- Docker
- Docker Compose

## Getting Started

1. Clone this repository:
   ```
   git clone <repository-url>
   cd <repository-name>
   ```

2. Copy the example environment file and adjust as needed:
   ```
   cp .env.example .env
   ```
   
   Make sure to set a secure `JWT_SECRET` in your `.env` file.

3. Build the Docker images:
   ```
   docker-compose build
   ```

4. Start the services:
   ```
   docker-compose up
   ```

5. In another terminal, create and set up the database:
   ```
   docker-compose exec web rails db:create db:migrate
   ```

Your Rails API should now be running and accessible at `http://localhost:3000`.

## Interacting with the Container

To start an interactive shell session inside the container:
```
docker-compose exec web bash
```

This will give you a bash prompt inside the container, where you can run Rails commands directly.

For more detailed instructions on how to interact with the Docker container, including running specific Rails commands and more, please refer to the [DOCKER_COMMANDS.md](DOCKER_COMMANDS.md) file.

## Development Workflow

1. Make changes to your code on your local machine.
2. The changes will be automatically reflected in the running container due to volume mounting.
3. Use the provided Insomnia collection for API testing.

## Stopping the Application

To stop the application:
```
docker-compose down
```

This will stop and remove the containers, but preserve the database data.

## Additional Information

- The `config/database.yml` file is configured to use environment variables from the `.env` file.
- The PostgreSQL data is persisted in a Docker volume.
- The application code is mounted as a volume, allowing for live code reloading during development.
- JWT configuration is in `config/initializers/devise.rb`
- User authentication is handled via Devise with JWT tokens
- Session tracking includes user agent and IP information

## Customization

Feel free to modify the Dockerfile, docker-compose.yml, and .env files to suit your specific project needs.

## Troubleshooting

If you encounter any issues, try the following steps:

1. Ensure all services are up to date: `docker-compose pull`
2. Rebuild the containers: `docker-compose build`
3. Remove all containers and volumes, then restart: `docker-compose down -v && docker-compose up --build`

If problems persist, check the Docker logs: `docker-compose logs`

## Next Steps

Now that you have a basic Rails API set up, you can start building your application:

1. Generate additional models and controllers
2. Set up your routes in `config/routes.rb`
3. Implement your API endpoints
4. Add authentication if needed
5. Write tests for your API

Remember to commit your changes regularly as you develop your application.