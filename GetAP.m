function Struct=GetAP(Mat,smt,thresh)


%--Get Logical Matrix
LogMat=Mat<thresh;
SmLogMat = medfilt2(LogMat, smt ,'symmetric');

%--find all boundaries
B = bwboundaries(SmLogMat);

%--find A & P for all patches
A=zeros(length(B),1);
P=zeros(length(B),1);
for k = 1:length(B)
    
    f=find(B{k}(:,1)~=112 & B{k}(:,1)~=1);
    red_B=B{k}(f,1);
    P(k)=length(red_B);
    A(k)=polyarea(B{k}(:,1),B{k}(:,2));
    
end

Struct.SmLogMat=SmLogMat;
Struct.PatchesArea=A;
Struct.PatchesPerimeter=P;

%--find largest one
if ~isempty(A)
    [~,p]=max(A);
    MainPatch=B{p};
    
    Struct.MainPatch=MainPatch;
    Struct.MainPatch_A=A(p);
    Struct.MainPatch_P=P(p);
    
end




