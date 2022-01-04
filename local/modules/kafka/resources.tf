resource "helm_release" "kafka" {
  name = "kafka"
  chart = "${var.project_root}/kafka"
  namespace = "kafka"
  dependency_update = true
  
  set {
    name = "kafkaReplicas"
    value = 1
  }

  set {
    name = "zookeeperReplicas"
    value = 1
  }

  set {
    name = "kafkaConnectReplicas"
    value = 1
  }
}
