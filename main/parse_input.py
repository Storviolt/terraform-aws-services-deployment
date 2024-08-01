import json

# Chemin vers le fichier d'entrée
input_file_path = "input_to_parse.txt"
output_file_path = "terraform.tfvars.json"

# Fonction pour lire et parser le fichier d'entrée
def parse_input_file(file_path):
    resources = {
        "ec2_instances": [],
        "s3_buckets": [],
        "elbs": []
    }

    with open(file_path, 'r') as file:
        lines = file.readlines()[3:]  # Skip the first three lines

        for line in lines:
            parts = line.strip().split(':')
            if parts[0] == "ec2":
                resources["ec2_instances"].append({
                    "name": parts[1],
                    "ami": parts[2],
                    "instance_type": parts[3],
                    "html_content": parts[4]
                })
            elif parts[0] == "s3":
                resources["s3_buckets"].append({
                    "name": parts[1]
                })
            elif parts[0] == "elb":
                resources["elbs"].append({
                    "name": parts[1],
                    "instances": parts[2].split(',')
                })

    return resources

# Fonction pour générer le fichier JSON
def generate_json(resources, output_file_path):
    with open(output_file_path, 'w') as file:
        json.dump(resources, file, indent=4)

# Parse le fichier d'entrée
resources = parse_input_file(input_file_path)

# Génére le fichier JSON
generate_json(resources, output_file_path)

print(f"JSON configuration generated in {output_file_path}")
