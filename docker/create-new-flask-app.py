from sys import argv, exit

PATH=''

def parse_args():
    if '--service-name' not in argv or '--domain-name' not in argv:
        exit('create-new-flask-app.py --service-name <service name> --domain-name <domain name>')
    service_name = argv[argv.index('--service-name')+1]
    image_name = service_name + ':latest'
    domain_name = argv[argv.index('--domain-name')+1]
    return (service_name, image_name, domain_name)

def create_docker_compose():
    os.system('cp traefik-labels-docker-compose-template.yaml ' + PATH + 'docker-compose.yaml')
    os.system("sed -i 's/$SERVICENAME/" + service_name + "/g " + PATH + "docker-compose.yaml")
    os.system("sed -i 's/$IMAGENAME/" + image_name + "/g " + PATH + "docker-compose.yaml")
    os.system("sed -i 's/$DOMAINNAME/" + domain_name + "/g " + PATH + "docker-compose.yaml")

def main():
    args = parse_args()
    os.system('cp flask-app-core.Dockerfile ' + PATH + 'Dockerfile')
    create_docker_compose()

if __name__ == '__main__':
    main()
