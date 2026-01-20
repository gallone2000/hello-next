PROJECT ?= hello-next
DEV_COMPOSE = docker-compose.dev.yml
PROD_COMPOSE = docker-compose.yml

.PHONY: help dev-up dev-down dev-logs dev-shell prod-build prod-up prod-down prod-logs prod-shell clean nuke deps-add deps-rm deps-install

help:
	@echo ""
	@echo "Targets:"
	@echo "  dev-up       Avvia ambiente DEV (hot reload)"
	@echo "  dev-down     Ferma DEV"
	@echo "  dev-logs     Logs DEV"
	@echo "  dev-shell    Shell nel container DEV"
	@echo ""
	@echo "  prod-build   Build immagine PROD"
	@echo "  prod-up      Avvia ambiente PROD"
	@echo "  prod-down    Ferma PROD"
	@echo "  prod-logs    Logs PROD"
	@echo "  prod-shell   Shell nel container PROD"
	@echo ""
	@echo "  clean        Stop + rimozione volumi (attenzione)"
	@echo ""

# ---------------- DEV ----------------
dev-up:
	docker compose -f $(DEV_COMPOSE) up

dev-down:
	docker compose -f $(DEV_COMPOSE) down

dev-logs:
	docker compose -f $(DEV_COMPOSE) logs -f --tail=200

dev-shell:
	docker compose -f $(DEV_COMPOSE) exec web sh

# ---------------- PROD ----------------
prod-build:
	docker compose -f $(PROD_COMPOSE) build

prod-up:
	docker compose -f $(PROD_COMPOSE) up --build -d

prod-down:
	docker compose -f $(PROD_COMPOSE) down

prod-logs:
	docker compose -f $(PROD_COMPOSE) logs -f --tail=200

prod-shell:
	docker compose -f $(PROD_COMPOSE) exec web sh

deps-add:
	docker compose -f $(DEV_COMPOSE) run --rm web sh -lc "npm install $(PKG)"

deps-rm:
	docker compose -f $(DEV_COMPOSE) run --rm web sh -lc "npm uninstall $(PKG)"

deps-install:
	docker compose -f $(DEV_COMPOSE) run --rm web sh -lc "npm install"

# ---------------- Cleanup ----------------
# ---------------- Cleanup ----------------
clean:
	@echo "Stopping DEV + PROD (keeping volumes)..."
	docker compose -f $(DEV_COMPOSE) down || true
	docker compose -f $(PROD_COMPOSE) down || true

nuke:
	@echo "Stopping and removing DEV + PROD (including volumes)..."
	docker compose -f $(DEV_COMPOSE) down -v || true
	docker compose -f $(PROD_COMPOSE) down -v || true
