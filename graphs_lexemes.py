#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import networkx as nx
import matplotlib.pyplot as plt


# In[28]:


# загружаем данные

file_path = "final_marker.csv"

data = pd.read_csv(file_path, header=None, encoding='utf-8')
data.columns = data.iloc[0]
data = data.drop(0).reset_index(drop=True)

data.head()


# In[29]:


# создаем граф, в котором каждый вариант жеста - вершина

G = nx.Graph()
for i in range(len(data)):
    G.add_node(i+1)


# In[30]:


# удаляем параметры, который не рассматриваем при построении графа

data = data.drop('Отношение к говорящему (ладонь)', axis=1)
data = data.drop('Траекторное + / Локальное -', axis=1)


# In[31]:


# функция для подсчета различий между двумя вариантами жеста

def count_differences(row1, row2):
    count = 0
    for i in range(len(row1)):
        if row1[i] != row2[i]:
            count += 1
    return count


# In[32]:


# если различие ровно 1 или его нет, то проводим ребро 

for i in range(len(data)):
    for j in range(i+1, len(data)):
        if count_differences(data.iloc[i], data.iloc[j]) == 1 or count_differences(data.iloc[i], data.iloc[j]) == 0:
            G.add_edge(i+1, j+1)


# In[33]:


# выделяем из графа все циклы

G_directed = nx.DiGraph(G)
c = nx.simple_cycles(G_directed)
cycle_sets = []
for i in c:
    if set(i) not in cycle_sets:
        cycle_sets.append(set(i))

cycle_unique = []
for i in cycle_sets:
    if len(i) > 2:
        ind = 0
        for j in cycle_sets:
            if i.issubset(j) and i!=j:
                ind = 1
        if ind == 0 :
            cycle_unique.append(i)


# In[35]:


# находим все вершины, которые участвуют в циклах

cycle_unique_nodes = set()
for i in cycle_unique:
    for j in i:
        cycle_unique_nodes.add(j)

cycle_unique_nodes


# In[36]:


# находим все прочие вершины
other_nodes = []
for n in G.nodes:
    if n not in cycle_unique_nodes:
        other_nodes.append(n)


# In[39]:


# список всех лексем
all_lexemas = []

# добавляем все циклы в лексемы
for l in cycle_unique:
    all_lexemas.append(l)

# находим все прочие вершины, у которых есть ребра. Те у которых нет добавляем как отдельные лексемы
other_lexemas_nodes = []
for n in other_nodes:
    if len(G[n]) == 0:
        all_lexemas.append(set([n]))
    else:
        other_lexemas_nodes.append(n)

for e in G.edges:
    if e[0] in other_lexemas_nodes or e[1] in other_lexemas_nodes:
        all_lexemas.append(set(e))
all_lexemas


# In[ ]:




