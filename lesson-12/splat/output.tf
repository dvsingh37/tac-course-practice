output "ebs_block_device" {
  description = "ebs block device details"
  value       = aws_instance.dv_splat.ebs_block_device[*].volume_id

}