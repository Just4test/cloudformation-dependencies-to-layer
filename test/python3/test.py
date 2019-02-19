def handler(event, context):
  cfnyaml = __import__('cfnyaml')
  return str(cfnyaml)
