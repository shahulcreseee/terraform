locals {
  rg_default_args = {
    name = ""
    location = ""
    tags = {
        module = "Resource Group"
        created_by = "Mr.Shak"
    }
  }
  rg_yaml_files = fileset(var.resource_group_directory,"*.yaml")

  resource_groups_yaml = { for f in local.rg_yaml_files : f =>
    yamldecode(templatefile("${var.resource_group_directory}/${f}", {}))
  }

  resource_groups = (
    {
      for k, v in local.resource_groups_yaml : k => merge(
        local.rg_default_args,
        v,
        {
          tags = merge(
            try(v.tags, {}),
            local.rg_default_args.tags
          )
        }
      )
    }
  )
}