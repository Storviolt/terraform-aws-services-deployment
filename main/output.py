import subprocess
import json

def run_aws_cli_command(command):
    """Executes an AWS CLI command and returns the JSON response."""
    try:
        result = subprocess.run(command, shell=True, check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return json.loads(result.stdout)
    except subprocess.CalledProcessError as e:
        print(f"Error executing command: {e.stderr}")
        return {}

def get_ec2_instances_info():
    #aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId,Tags[?Key=='Name'].Value | [0],ImageId,InstanceType,PublicIpAddress,PrivateIpAddress]" --output json
    command = "aws ec2 describe-instances --query \"Reservations[*].Instances[*].[InstanceId,Tags[?Key=='Name'].Value | [0],ImageId,InstanceType,PublicIpAddress,PrivateIpAddress]\" --output json"
    instances_info = run_aws_cli_command(command)
    
    ec2_instances = []
    if instances_info:
        for reservation in instances_info:
            for instance in reservation:
                ec2_instances.append({
                    'id': instance[0],
                    'name': instance[1] if instance[1] else 'N/A',
                    'ami': instance[2],
                    'instance_type': instance[3],
                    'public_ip': instance[4] if instance[4] else 'N/A',
                    'private_ip': instance[5] if instance[5] else 'N/A'
                })
    return ec2_instances

def get_s3_buckets_info():
    command = 'aws s3api list-buckets --query "Buckets[*].Name" --output json'
    buckets_info = run_aws_cli_command(command)
    
    s3_buckets = []
    if buckets_info:
        for name in buckets_info:
            s3_buckets.append({'name': name})
    return s3_buckets

def get_elb_info():
    command = 'aws elb describe-load-balancers --query "LoadBalancerDescriptions[*].[LoadBalancerName,DNSName,Instances[*].InstanceId]" --output json'
    elbs_info = run_aws_cli_command(command)
    
    elbs = []
    if elbs_info:
        for elb in elbs_info:
            elbs.append({
                'name': elb[0],
                'dns_name': elb[1],
                'instances': [instance_id for instance_id in elb[2]]
            })
    return elbs

def generate_output():
    output = {
        'ec2_instances': get_ec2_instances_info(),
        's3_buckets': get_s3_buckets_info(),
        'elbs': get_elb_info()
    }
    
    with open('output.json', 'w') as f:
        json.dump(output, f, indent=4)
    
    print("Output generated and saved to output.json")

if __name__ == "__main__":
    generate_output()
