up:
	@vagrant up --provider virtualbox

ssh:
	@vagrant ssh master

down:
	@vagrant halt

destroy:
	@vagrant destroy -f 

