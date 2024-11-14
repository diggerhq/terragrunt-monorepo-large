import json
import networkx as nx
import matplotlib.pyplot as plt
from pathlib import Path
import random

def load_dependency_map(json_path):
    with open(json_path) as f:
        return json.load(f)

def create_dependency_graph(dependency_map):
    G = nx.DiGraph()
    
    # Add nodes
    for node in dependency_map.keys():
        # Use the last two parts of the path as node label
        label = '/'.join(Path(node).parts[-2:])
        G.add_node(node, label=label)
    
    # Add edges
    for source, targets in dependency_map.items():
        for target in targets:
            G.add_edge(source, target)
    
    return G

def plot_dependency_graph(G, output_path, plot_type='spring'):
    plt.figure(figsize=(20, 20))
    
    # Choose layout
    if plot_type == 'spring':
        pos = nx.spring_layout(G, k=1, iterations=50)
    elif plot_type == 'circular':
        pos = nx.circular_layout(G)
    elif plot_type == 'kamada_kawai':
        pos = nx.kamada_kawai_layout(G)
    else:
        pos = nx.spring_layout(G)
    
    # Plot edges
    nx.draw_networkx_edges(G, pos, 
                          edge_color='gray',
                          alpha=0.2,
                          arrows=True,
                          arrowsize=10)
    
    # Plot nodes
    nx.draw_networkx_nodes(G, pos,
                          node_size=100,
                          node_color='lightblue',
                          alpha=0.6)
    
    # Add labels using the shortened names
    labels = nx.get_node_attributes(G, 'label')
    nx.draw_networkx_labels(G, pos, labels,
                           font_size=8,
                           font_weight='bold')
    
    # Add title and remove axes
    plt.title("Terragrunt Dependencies Graph", pad=20, size=16)
    plt.axis('off')
    
    # Save plot
    plt.savefig(output_path, format='png', dpi=300, bbox_inches='tight')
    plt.close()

def analyze_graph(G):
    analysis = {
        'total_nodes': G.number_of_nodes(),
        'total_edges': G.number_of_edges(),
        'average_degree': sum(dict(G.degree()).values()) / G.number_of_nodes(),
        'density': nx.density(G),
        'strongly_connected_components': nx.number_strongly_connected_components(G),
        'longest_path': len(nx.dag_longest_path(G)) if nx.is_directed_acyclic_graph(G) else "Graph contains cycles"
    }
    
    # Find nodes with most dependencies
    in_degrees = dict(G.in_degree())
    out_degrees = dict(G.out_degree())
    
    analysis['most_dependent_nodes'] = sorted([(node, degree) for node, degree in in_degrees.items()], 
                                            key=lambda x: x[1], 
                                            reverse=True)[:5]
    analysis['most_depended_on_nodes'] = sorted([(node, degree) for node, degree in out_degrees.items()], 
                                              key=lambda x: x[1], 
                                              reverse=True)[:5]
    
    return analysis

def print_analysis(analysis):
    print("\nDependency Graph Analysis:")
    print(f"Total Nodes: {analysis['total_nodes']}")
    print(f"Total Edges: {analysis['total_edges']}")
    print(f"Average Degree: {analysis['average_degree']:.2f}")
    print(f"Graph Density: {analysis['density']:.4f}")
    print(f"Strongly Connected Components: {analysis['strongly_connected_components']}")
    print(f"Longest Path Length: {analysis['longest_path']}")
    
    print("\nTop 5 Most Dependent Nodes (highest in-degree):")
    for node, degree in analysis['most_dependent_nodes']:
        print(f"  {Path(node).parts[-2:]}: {degree} dependencies")
    
    print("\nTop 5 Most Depended On Nodes (highest out-degree):")
    for node, degree in analysis['most_depended_on_nodes']:
        print(f"  {Path(node).parts[-2:]}: {degree} dependents")

def main():
    # Load dependency map
    json_path = "terragrunt-monorepo/dependency_map.json"
    dependency_map = load_dependency_map(json_path)
    
    # Create graph
    G = create_dependency_graph(dependency_map)
    
    # Generate different layout visualizations
    layouts = ['spring', 'circular', 'kamada_kawai']
    for layout in layouts:
        output_path = f"dependency_graph_{layout}.png"
        plot_dependency_graph(G, output_path, layout)
        print(f"Generated {output_path}")
    
    # Analyze and print statistics
    analysis = analyze_graph(G)
    print_analysis(analysis)

if __name__ == "__main__":
    main()
