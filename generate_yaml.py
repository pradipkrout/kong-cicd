import os
import yaml
from jinja2 import Environment, FileSystemLoader

konnect_service_name = os.environ.get('KONNECT_SERVICE_NAME')
konnect_runtime_group = os.environ.get('KONNECT_RUNTIME_GROUP')

if not os.path.exists('results'):
    os.makedirs('results')

file_name = os.getcwd() + '/kong/{0}/{1}_{2}.yaml'.format(konnect_runtime_group,konnect_service_name, konnect_runtime_group)
results_file_name = os.getcwd() + '/results/{0}_{1}.yaml'.format(konnect_service_name, konnect_runtime_group)
print("Results file is :" + results_file_name)

try:
    with open(file_name, 'r') as file:
        values = yaml.safe_load(file)
        # Load templates file from templates folder
        env = Environment(loader = FileSystemLoader('./templates'),   trim_blocks=True, lstrip_blocks=True)
        
        template = env.get_template('{0}.yaml.j2'.format(konnect_service_name))
        file=open(results_file_name, "w")
        file.write(template.render(values))
        file.close()
except IOError as e:
    print('Error loading Template file or results - File not found!!!' + e)

print("Yaml file is generated successfully")

with open(results_file_name) as f:
    data = yaml.load(f, Loader=yaml.FullLoader)
    print(data)
    f.close()