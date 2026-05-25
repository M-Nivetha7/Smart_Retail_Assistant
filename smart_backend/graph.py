import heapq

# Store graph (aisles as nodes)
graph = {
    "entrance": {"A1": 2, "A2": 4},
    "A1": {"A3": 2, "checkout": 5},
    "A2": {"A3": 1},
    "A3": {"checkout": 2},
    "checkout": {}
}

def shortest_path(start, end):
    queue = [(0, start, [])]
    visited = set()

    while queue:
        cost, node, path = heapq.heappop(queue)

        if node in visited:
            continue

        path = path + [node]
        visited.add(node)

        if node == end:
            return path

        for neighbor, weight in graph.get(node, {}).items():
            heapq.heappush(queue, (cost + weight, neighbor, path))

    return []