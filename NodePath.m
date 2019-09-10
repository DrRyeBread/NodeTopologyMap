clc; clear all; close all;
load edgy.mat;

EdgeTable = EdgeTable.' | EdgeTable;
G = graph(EdgeTable);
figure
p=plot(G,'Layout','layered');
layout(p,'layered','direction','down','sources',[1],'sinks',[8]);
Gdir = digraph(adjacency(G));
pdir=plot(Gdir,'Layout','layered');
layout(pdir,'layered','direction','down','sources',[1],'sinks',[8]);

figure
spath = shortestpath(Gdir,1,8);
highlight(pdir,spath,'EdgeColor','g');
% srch = bfsearch(Gdir,1,'allevents');
% srch.EdgeIndex

% Classic... there's a function that does this. See below
% i = outedges(G,1);
% I = G.Edges(i,:);
% x = table2array(splitvars(I));
% s(:,1) = x(:,1);
% t(:,1) = x(:,2);
% 
% for n = 2:14
%    
%     i = outedges(G,n);
%     I = G.Edges(i,:);
%     x = table2array(splitvars(I));
% %     in = find(x(:,1)~=n);
% %     x(in,:)=[];
%     is(:,1) = x(:,1);
%     it(:,1) = x(:,2);
%     s = [s;is];
%     t = [t;it];
%     clear is
%     clear it
% end

table=Gdir.Edges;
x = table2array(splitvars(table));
s(:,1) = x(:,1);
t(:,1) = x(:,2);

for l = 0:3
    il = l+2;
    figure(il)
    c=0;
for n = (1+(24*l)):(24*(l+1))
    c = c+1;
    subplot(4,6,c);
    srun = s(1:n,:);
    trun = t(1:n,:);
    Gdir = digraph(srun,trun);
    plot(Gdir);
    pdir=plot(Gdir,'Layout','layered');
    layout(pdir,'layered','direction','down','sources',[1]);
    
end
end




