clc; clear all; close all;

%Load logical adjacency matrix
load edgy.mat;

%Force adjacency matrix to be symmetric
EdgeTable = EdgeTable.' | EdgeTable;

%Graph nodes based on matrix
G = graph(EdgeTable);
figure

%Plotting
p=plot(G,'Layout','layered');
layout(p,'layered','direction','down','sources',[1],'sinks',[8]);
G = graph(adjacency(G));
p=plot(G,'Layout','layered');
layout(p,'layered','direction','down','sources',[1],'sinks',[8]);
figure

% Finds the shortest path to the objective (least number of nodes) and
% highlights. Leave commented out if you want node topology tree without
% arrows
% spath = shortestpath(G,1,8);
% highlight(p,spath,'EdgeColor','g');

%Makes a directional node graph
Gdir = digraph(adjacency(G));
pdir=plot(Gdir,'Layout','layered');
layout(pdir,'layered','direction','down','sources',[1],'sinks',[8]);

%Pulls out node direction information from graph
table=Gdir.Edges;
x = table2array(splitvars(table));

%source nodes
s(:,1) = x(:,1);

%sink nodes
t(:,1) = x(:,2);

[rows, columns] = size(s);

%Gets number of rows to find the number of figures needed to display the
%plots
r=rows;

%Sets the number of plots per figure. Make it a square
numPlots = 9;
Prun = floor(r/numPlots) + 1;

%For loop for displaying breadthfirst search
for L = 1:Prun %For loop for displaying figures
    il = L+2;
    figure(il)
    
    for n = 1:numPlots %For loop for displaying each plot
        
        T = n+numPlots*(L-1); %Sets index for node matrices
        
        if T == r+1
            break;
        end
        
        %Takes the whitespace out of the figures for plot clarity
        sqrtPlots = sqrt(numPlots);
        subplot_tight(sqrtPlots,sqrtPlots,n,0) %subplot_tight.m from internet
        
        %Plots all node paths from 1 to the end of the matrix
        srun = s(1:T,:);
        trun = t(1:T,:);
    
        %Plot each graph
        Gdir = digraph(srun,trun);
        plot(Gdir);
        pdir=plot(Gdir,'Layout','layered');
        layout(pdir,'layered','direction','down','sources',[1]);
    end
end




