# diagram.py
from diagrams import Cluster, Diagram, Edge
from diagrams.aws.mobile import APIGateway

graph_attr = {
    "fontsize": "28",
    "fontname": "Helvetica",
    "style": "rounded",
    "bgcolor": "transparent"
}

major_cluster ={
    "fontsize": "24",
    "fontname": "Helvetica",
    "style": "rounded",
    "bgcolor": "transparent"
}

cluster ={
    "fontsize": "16",
    "fontname": "Helvetica",
    "style": "rounded",
    "bgcolor": "transparent"
}

with Diagram("Serverless",graph_attr=graph_attr,direction="LR"):
   APIGateway("API")
