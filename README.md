Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

# Dream App

A Rails app for journaling your dreams and getting an AI-powered interpretation of them — themes, symbols, a short analysis, a generated illustration, and a chat to ask follow-up questions about what it might mean.

## Features

- **Dream journal** — log a dream with the date, your mood, and a free-text description.
- **AI interpretation** — each dream is sent to an LLM which returns a title, summary, themes, and symbols in a structured format ([app/schemas/dream_interpretation_schema.rb](app/schemas/dream_interpretation_schema.rb)).
- **AI-generated illustration** — a surreal, Ghibli-styled image representing the dream is generated asynchronously in the background ([app/jobs/image_generation_job.rb](app/jobs/image_generation_job.rb)).
- **Follow-up chat** — ask the AI more about a dream's meaning; conversation history is kept per dream.
- **Tagging & filtering** — dreams are auto-tagged by theme and symbol, and the dream list can be filtered by either.
- **Authentication** — email/password or Google OAuth sign-in (via Devise + Omniauth).

## Tech stack

- Ruby 3.3.5 / Rails 8.1
- PostgreSQL
- [ruby_llm](https://github.com/crmne/ruby_llm) for LLM chat, structured output, and image generation (OpenAI)
- Solid Queue / Solid Cache / Solid Cable (no Redis required)
- Devise + Omniauth (Google OAuth2)
- Active Storage with Cloudinary for image uploads
- Bootstrap 5, importmaps, Turbo & Stimulus (Hotwire)
- Kamal for deployment

## Getting started

### Prerequisites

- Ruby 3.3.5 (see [.ruby-version](.ruby-version))
- PostgreSQL running locally
- An OpenAI API key
- A Google OAuth client (for Google sign-in) — optional for local dev
- A Cloudinary account (for image storage) — optional for local dev

### Setup

```bash
git clone <repo-url>
cd dream-app
bin/setup
```

`bin/setup` installs dependencies, prepares the database, and starts the dev server. Pass `--skip-server` to skip the last step, or `--reset` to reset the database.

### Environment variables

Create a `.env` file in the project root (loaded via `dotenv-rails` in development/test):

```
OPENAI_API_KEY=your_openai_api_key
GOOGLE_OAUTH_CLIENT_ID=your_google_client_id
GOOGLE_OAUTH_CLIENT_SECRET=your_google_client_secret
CLOUDINARY_URL=your_cloudinary_url
```

### Running the app

```bash
bin/dev
```

This starts the Rails server along with the asset watchers. Visit `http://localhost:3000`.

## Testing

```bash
bin/rails test
```

## Linting & security

```bash
bin/rubocop
bin/brakeman
bin/bundler-audit
```

Or run everything CI runs:

```bash
bin/ci
```

## Deployment

This app is set up for deployment with [Kamal](https://kamal-deploy.org) — see [config/deploy.yml](config/deploy.yml).

```bash
bin/kamal deploy
```
