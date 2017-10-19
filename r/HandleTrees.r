### galaxyTree()

#
# retrieve galaxytrees from database and plot them ala Delucia & Blaizot 2006
#
galaxyTree<-function(root="0", tableName="MRscPlanck1",context="Henriques2015a",plot=FALSE,token=Null)
{
  sql=paste("
  select p.fofsubhaloid as fof
  ,      p.snapnum
  ,      1 + p.galaxyid-",root," as id
  ,      1 + p.descendantId-",root," as descendant
  ,      p.lastprogenitorId-",root," as lastprogenitor
  ,      p.stellarmass as mass
  ,      p.B_Dust-p.V_Dust as color
  ,      p.V_Dust as mag
  ,      p.sfr
  ,      p.type
    from ",tableName," d
    ,    ",tableName," p
   where d.galaxyId=",root,"
     and p.galaxyId between d.galaxyId and d.lastprogenitorid
   order by p.galaxyId
  ",sep="")
  data<-queryCAS(sql,token=token,context=context)  
  for(i in 2:length(data))
    data[,i]<-as.numeric(data[,i])
  tree<-list()
  tree$tableName = tableName
  tree$root = root
  tree$data = data

  if(plot)
    plotGalaxyTree(tree=tree)
  tree
}
#------------------------------------------------------------------
# Plot the specified galaxy tree ala DeLucia & Blaizot 2006, Fig. 1
#------------------------------------------------------------------
plotGalaxyTree<-function(treeMD, minMass=.01,scale=4,minColor=NULL,maxColor=NULL)
{
  tree<-treeMD$data
  root<-treeMD$root
  tableName<-treeMD$tableName

  mainLeaf<-min(tree$lastprogenitor)+1

  dim=length(tree$id)

  # derive X and Y-limits
  xlims=c(-dim*.01,dim*1.02)
  minSnapnum<-min(tree$snapnum)
  maxSnapnum<-max(tree$snapnum)
  ylims=c(minSnapnum-2,maxSnapnum+2)
  ylims=c(maxSnapnum+2,minSnapnum-2)


  # define color map
  if(is.null(minColor))
    minColor<-min(tree$color)
  if(is.null(maxColor))
    maxColor<-max(tree$color)
  dc = maxColor-minColor
  colors<-rainbow(256)
  icolor=256-floor(256*(tree$color-minColor)/dc)
  icolor[which(icolor<1)]=1
  icolor[which(icolor> 256)]=256
  color<-colors[icolor]
  colorx=1
  colory=(0:255*dc/255+minColor)
  colorbar<-matrix(255:0,1,256)

  # calculate x coordinate
  y = tree$snapnum
  x = (tree$lastprogenitor+tree$id-y[1]+y)/2

  # calculate segment coordinates
  d<-tree$descendant
  # ensure root points at root
  d[1]<-tree$id[1]
  rootX<-x[d]
  rootY<-y[d]

  #-------------------------------------
  # sizes of points, logarithmic in mass
  #-------------------------------------
  # select massive galaxies
  massive<-which(tree$mass >= minMass)
  # determine limits of mass
  massMin = min(tree$mass[massive])
  massMax = max(tree$mass[massive])
  # define legenda circle sizes
  legendaMasses<-c(.001,.003,.01,.03,.1,.3,1,3.,10,30,100,300,1000)
  legendaMasses=subset(legendaMasses, legendaMasses>=massMin & legendaMasses<= massMax)
  # logarithmic
  massMin=log10(massMin)
  massMax=log10(massMax)
  dm=massMax-massMin
  legendaSizes=scale*(log10(legendaMasses)-massMin)/dm
  legendaMasses<-1e10*legendaMasses

  # give 0 sizes for non-massive halos, logarithmicly scaled sizes to massive ones
  size=0*tree$mass
  size[massive]=scale*(log10(tree$mass[massive])-massMin)/dm

  # initialize plotting layout
  lay<-layout(matrix(c(1,2,3,0),2,2,byrow=TRUE),c(6,1),c(6,1))

  #--------
  # 1: tree
  #--------
  op<-par(mar=c(0,4,4,2))
  plot(-1,-1,xlim=xlims,ylim=ylims,xaxs="i",yaxs="i",axes=FALSE,ann=FALSE)
  box()
  axis(2)
  # segments first, then points, so that points ovewrwrite the lines
  segments(x,y,rootX,rootY,col=color)
  points(x,tree$snapnum,col=color,pch=19,cex=size)
  points(x,tree$snapnum,col="black",pch=1,cex=size)
  title(main=paste("Table : ",tableName,"\nGalaxy ID = ",root),ylab="snapnum")

  #-------------
  # 2: color bar
  #-------------
  par(mar=c(0,4,4,1))
  image(z=colorbar,x=colorx,y=colory,col=rainbow(256),axes=FALSE,ann=FALSE)
  axis(2)
  title(ylab="B-V")

  #--------------
  # 3: mass sizes
  #--------------
  par(mar=c(0,0,2,0))
  xes=1:length(legendaMasses)
  yes=0*xes+.5
  plot(-1,-1,xlim=c(0,length(legendaMasses)+1),ylim=c(0,1),axes=FALSE)
  text(xes,yes+.3,legendaMasses)
  points(xes,yes-.1,pch=19,cex=legendaSizes,col="red")
  points(xes,yes-.1,pch=1,cex=legendaSizes)
  title(main="stellar mass")

  layout(matrix(1))
}


#
# retrieve galaxytrees from database and calculate contour path
#
galaxyTreePath<-function(root="0", tableName="millimil..DeLucia2006a")
{
  sql=paste("
  select p.snapnum
  ,      1 %2B p.galaxyid-",root," as id
  ,      1 %2B p.descendantId-",root," as descendant
  ,      1 %2B p.lastprogenitorId-",root," as lastprogenitor
  ,      p.stellarmass as mass
  ,      p.mag_bdust-p.mag_vdust as color
  ,      p.mag_vdust as mag
  ,      p.sfr
  ,      p.type
    from ",tableName," d
    ,    ",tableName," p
   where d.galaxyId=",root,"
     and p.galaxyId between d.galaxyId and d.lastprogenitorid
   order by p.galaxyId
  ",sep="")
  tree<-gavoWebQuery(webAppUrl, user, password, sql,numeric=TRUE)  
  tree$path<-calculateTreeCountourPath(tree)
  tree
}

# Calculate a contour path for the specified tree.
# Assumes that the id vector in the tree are consecutive, starting at 1
# The tree's lastdecendant and descendant pointers have to be defined
# wrt these ids 
# loop based implementation
calculateTreeContourPath<-function(tree)
{
  path=c()
  last<-0
  current = 1
  while(current > 0)
  {
    path<-c(path, current)
    if(last < current)
      last<-current
    if(tree$lastprogenitor[current] > last)
      current<-last+1
    else
      current<-tree$descendant[current]
  }
  path
}
#
# 
#
calculateTreeProgsCountPath<-function(tree)
{
# first find direct progenitor count from descendant list
  progcount<-0*tree$id
  for(d in tree$descendant)
  {
    if(d > 0)
      progcount[d]<-progcount[d]+1
  }

  path=c(progcount[1]-1)
  for(node in 2:length(progcount))
    path[node]<-path[node-1]+progcount[node]-1
  path
}
############################################################
##################       Halo Trees       ##################
############################################################
#
# retrieve halo trees from database and plot them ala Delucia & Blaizot 2006
#
haloTree<-function(root="0", tableName="MR",context="MPAHaloTrees", token=NULL, plot=FALSE)
{
  sql=paste("
  select p.snapnum
  ,      1 + p.haloid-",root," as id
  ,      1 + p.descendantId-",root," as descendant
  ,      1 + p.lastprogenitorId-",root," as lastprogenitor
  ,      p.np as mass
  ,      p.vmax as vmax
  ,      1 + p.firsthaloinfofgroupid -",root," as fof
    from ",tableName," d
    ,    ",tableName," p
   where d.haloId=",root,"
     and p.haloId between d.haloId and d.lastprogenitorid
   order by p.haloId
  ",sep="")
  data<-queryCAS(sql,context=context,token=token)  
  tree<-list()
  tree$tableName = tableName
  tree$root = root
  tree$data = data

  if(plot)
    plotHaloTree(treeMD=tree)
  tree
}

#------------------------------------------------------------------
# Plot the specified halo tree ala DeLucia & Blaizot 2006, Fig. 1
#------------------------------------------------------------------
plotHaloTree<-function(treeMD, minMass=20,scale=4,USEVMAX=FALSE,minSnapnum=NULL)
{
  tree<-treeMD$data
  root<-treeMD$root
  tableName<-treeMD$tableName

  mainLeaf<-min(tree$lastprogenitor)

  isfofcenter<-tree$id == tree$fof


  dim=length(tree$id)

  # derive X and Y-limits
  xlims=c(-dim*.01,dim*1.02)
  if(is.null(minSnapnum)) {  
    minSnapnum<-min(tree$snapnum)  
  }
  maxSnapnum<-max(tree$snapnum)
# root at top
  ylims=c(minSnapnum-2,maxSnapnum+2)
# root at bottom
  ylims=c(maxSnapnum+2,minSnapnum-2)
  ylims=c(maxSnapnum+2,minSnapnum=minSnapnum)


  # calculate x coordinate
  y = tree$snapnum
  x = (tree$lastprogenitor+tree$id-y[1]+y)/2

  # calculate segment coordinates
  d<-tree$descendant
  # ensure root points at root
  d[1]<-tree$id[1]
  rootX<-x[d]
  rootY<-y[d]

  #-------------------------------------
  # sizes of points, logarithmic in mass
  #-------------------------------------
  # select massive halos, i.e those taht will be represented with a symbol
  massive<-which(tree$mass >= minMass)
  # determine limits of mass
  massMin = min(tree$mass[massive])
  massMax = max(tree$mass[massive])
  # define legenda circle sizes
  #
  # TODO change this to something less hard-coded
  #   aim, have a decent number of legenda items with round numbers
  legendaMasses<-c(10,30,100,300,1000,3000,10000,30000,100000,300000,1000000)

#  legendaMasses<-calculateLegendaMasses(massMin, massMax, LOG=TRUE)

  legendaMasses=subset(legendaMasses, legendaMasses>=massMin & legendaMasses<= massMax)
  # logarithmic
  massMin=log10(massMin)
  massMax=log10(massMax)
  dm=massMax-massMin
  legendaSizes=scale*(log10(legendaMasses)-massMin)/dm

  # give 0 sizes for non-massive halos, logarithmicly scaled sizes to massive ones
  size=0*tree$mass
  size[massive]=scale*(log10(tree$mass[massive])-massMin)/dm

  # assign colors to halos: green if they are center of own fof group, red if not
  fofColor = "green"
  nonfofColor = "red"
  color=character(length(tree$id))
  color[which(tree$id == tree$fof)]=fofColor
  color[which(tree$id != tree$fof)]=nonfofColor

  # initialize plotting layout
  lay<-layout(matrix(c(1,2,3,0),2,1,byrow=TRUE),c(6,1),c(6,1))

  #--------
  # 1: tree
  #--------
  op<-par(mar=c(0,4,4,2),lwd=1)
  plot(-1,-1,xlim=xlims,ylim=ylims,xaxs="i",yaxs="i",axes=FALSE,ann=FALSE)
  box()
  axis(2)
  # segments first, then points, so that points ovewrwrite the lines
  segments(x,y,rootX,rootY,col='black')
  points(x,tree$snapnum,col=color,pch=19,cex=size)
  # draw edge
  points(x,tree$snapnum,col="black",pch=1,cex=size)
  title(main=paste("Table : ",tableName,"\nHalo ID = ",root),ylab="snapnum")

  #--------------
  # 3: mass sizes
  #--------------
  par(mar=c(0,0,2,0))
  xes=1:length(legendaMasses)
  yes=0*xes+.5
  plot(-1,-1,xlim=c(0,length(legendaMasses)+1),ylim=c(0,1),axes=FALSE)
  text(xes,yes+.3,legendaMasses)
  points(xes,yes-.1,pch=19,cex=legendaSizes,col="green")
  points(xes,yes-.1,pch=1,cex=legendaSizes)
  title(main="Halo N_p")

  layout(matrix(1))
}

#
# retrieve galaxytrees from database and plot them ala Delucia & Blaizot 2006
#
dolagHaloTree<-function(root="0", tableName="millimil..MPAHalo",plot=FALSE)
{
  sql=paste("
  select p.snapnum
  ,      1 %2B p.haloid-",root," as id
  ,      1 %2B p.descendantId-",root," as descendant
  ,      p.lastprogenitorId-",root," as lastprogenitor
  ,      p.submass0%2Bp.submass1%2Bp.submass2%2Bp.submass3
        %2Bp.submass4%2Bp.submass5 as mass
  ,      p.firsthaloinfofgroupid -",root," as fof
    from ",tableName," d
    ,    ",tableName," p
   where d.haloId=",root,"
     and p.haloId between d.haloId and d.lastprogenitorid
   order by p.haloId
  ",sep="")
  data<-gavoWebQuery(webAppUrl, user, password, sql,numeric=TRUE)  
  tree<-list()
  tree$tableName = tableName
  tree$root = root
  tree$data = data

  if(plot)
    plotHaloTree(tree=tree)
  tree
}

# function to calculate which masses should be used in a legenda.
# given are the actual min/max mass that must be represented, the number of 
# symbols (N) that should be used and whether logarithmic intervals are needed
calculateLegendaMasses<-function(massMin, massMax, N=5,LOG=TRUE)
{
  
}