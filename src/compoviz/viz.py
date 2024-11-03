import networkx as nx
import matplotlib.pyplot as plt


def config_to_service_graph(config: dict) -> nx.DiGraph | None:
    services: dict | None = config.get("services")
    if not services:
        return

    graph = nx.DiGraph()
    graph.add_nodes_from(services.keys())

    for service_name, service_definition in services.items():
        depends_on = service_definition.get("depends_on", [])
        for node in depends_on:
            graph.add_edge(node, service_name)

    return graph


def draw(config: dict, output: str):
    graph = config_to_service_graph(config)
    degree = dict(graph.degree)
    node_list = list(degree)
    node_size = [v * 500 for v in degree.values()]
    pos = nx.arf_layout(graph)
    nx.draw(
        graph,
        pos=pos,
        node_color="lightblue",
        nodelist=node_list,
        node_size=node_size,
        with_labels=True,
    )
    plt.savefig(output, dpi=300, bbox_inches="tight")
