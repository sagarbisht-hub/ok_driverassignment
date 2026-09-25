.PHONY: install dev test migrate seed
install:
	cd backend && python -m pip install -r requirements.txt
	cd frontend && npm install
dev:
	cd backend && alembic upgrade head && uvicorn app.main:app --reload
test:
	cd backend && pytest -q
migrate:
	cd backend && alembic upgrade head
seed:
	cd backend && python -c "from app.db.session import SessionLocal; from app.seed import seed; db=SessionLocal(); seed(db); db.close()"
