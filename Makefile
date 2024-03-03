compile:
	cd playground && flutter build web --web-renderer canvaskit

deploy:
	cd playground && firebase deploy

compile_and_deploy: compile deploy
