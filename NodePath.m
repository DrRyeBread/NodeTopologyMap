clc; clear all; close all;
load edgy.mat;

EdgeTable = EdgeTable.' | EdgeTable;
G = graph(EdgeTable);
figure
p=plot(G,'Layout','layered');
layout(p,'layered','direction','down','sources',[1],'sinks',[8]);
G = graph(adjacency(G));
p=plot(G,'Layout','layered');
layout(p,'layered','direction','down','sources',[1],'sinks',[8]);
figure
spath = shortestpath(G,1,8);
highlight(p,spath,'EdgeColor','g');

Gdir = digraph(adjacency(G));
pdir=plot(Gdir,'Layout','layered');
layout(pdir,'layered','direction','down','sources',[1],'sinks',[8]);

table=Gdir.Edges;
x = table2array(splitvars(table));
s(:,1) = x(:,1);
t(:,1) = x(:,2);

[rows, columns] = size(s);
r=rows;
numPlots = 9;
Prun = floor(r/numPlots) + 1;

for L = 1:Prun
    il = L+2;
    figure(il)
for n = 1:numPlots
    T = n+numPlots*(L-1);
    if T == r+1
        break;
    end
    sqrtPlots = sqrt(numPlots);
    subplot_tight(sqrtPlots,sqrtPlots,n,0)
    srun = s(1:T,:);
    trun = t(1:T,:);
    Gdir = digraph(srun,trun);
    plot(Gdir);
    pdir=plot(Gdir,'Layout','layered');
    layout(pdir,'layered','direction','down','sources',[1]);
end
end




