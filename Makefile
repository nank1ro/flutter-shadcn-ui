compile:
	cd playground && flutter build web --web-renderer canvaskit --no-tree-shake-icons

deploy:
	cd playground && firebase deploy

compile_and_deploy: compile deploy

publish:
	dart pub publish
