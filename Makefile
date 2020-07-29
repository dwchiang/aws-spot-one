
.PHONY: help bootstrap diff synth deploy destroy


help:
	@ echo 'Welcome to AWS Spot One Toolset'
	@ echo
	@ echo 'Usage: make [command]'
	@ echo
	@ echo 'Available Commands:'
	@ echo
	@ echo '  bootstrap                			cdk bootstrap'
	@ echo '  diff                				cdk diff'
	@ echo '  synth                				cdk synth'
	@ echo '  deploy                			cdk deploy'
	@ echo '  destroy                			cdk destroy'
	@ echo '  clean                             rm cdk.context.json'
	@ echo
	@ echo '================================================================================================'
	@ echo

##############################################################################
# cdk bootstrap
# Per Account & Per Region base
##############################################################################

bootstrap:

	cdk bootstrap

##############################################################################
# cdk diff
##############################################################################

diff:

	cdk diff -c use_default_vpc=1

synth:

	cdk synth -c use_default_vpc=1

deploy:

	cdk -c use_default_vpc=1 deploy

destroy:

	cdk destroy

clean:

	rm cdk.context.json