#Create account for BOLD Systems at http://boldsystems.org/
#Access Records:Search function available in the workbench tab
#Input query species into Taxonomy using the following format; "Genus species" AND "Genus species" AND "Genus species" ...
#Choose COI-5P Marker, set Min: 652, set Max: 652, enable Include Public Records
#Choose Project Data: All
#Click Sequences under the Downloads header, then click Apply Parameters, then click Download
#In RStudio use Import Dataset: From Text File
#Choose fasta.fas file, select Separator: Tab, Heading: No
#Repeat last two steps for enzyme.sites.txt in place of fasta.fas

#Generates data frame from fasta file with species names in column 1, number of vouchers in column 2, and empty columns for each restriction enzyme
Voucher_Species=vector(mode="character",length=nrow(fasta)/2)
Barcode=vector(mode="character",length=nrow(fasta)/2)
for(i in seq(1,nrow(fasta),2)){
  Voucher_Species[(i+1)/2]=sub(".*[|]","",sub("[|]COI-5P","",as.character(fasta[i,1])))
  Barcode[(i+1)/2]=as.character(fasta[i+1,1])
}
vouchers=cbind.data.frame(Voucher_Species, Barcode)[order(cbind.data.frame(Voucher_Species, Barcode)[,1]),]
Species=unique(vouchers[,1])
Number=vector(mode="numeric",length=length(Species))
for(i in 1:length(Number)){
  Number[i]=length(grep(as.character(results[i,1]),vouchers[,1]))
}
enzymes=data.frame(matrix(NA,nrow=length(Species),ncol=nrow(enzyme.sites)))
colnames(enzymes)=enzyme.sites[,1]
results=cbind.data.frame(Species,Number,enzymes)

#Fills data frame with average number of recognition sites per voucher (may take several hours)
for(i in 1:nrow(enzyme.sites)){
  enzyme=as.character(enzyme.sites[i,1])
  site_1=as.character(enzyme.sites[i,2])
  site_2=as.character(enzyme.sites[i,3])
  for(j in 1:length(Species)){
    hits_by_query=vector(mode="numeric",length=Number[j])
    for(k in 1:nrow(vouchers)){
      q_species=as.character(vouchers[k,1])
      DNA=as.character(vouchers[k,2])
      if(q_species==Species[j]){
        digest_1=gregexpr(site_1,DNA)[[1]]
        digest_2=gregexpr(site_2,DNA)[[1]]
        hits_1=ifelse(digest_1[1]>0,length(digest_1),0)
        hits_2=ifelse(digest_2[1]>0,length(digest_2),0)
        total_hits=hits_1+hits_2
        hits_by_query[k-sum(Number[1:j-1])]=total_hits
      }
    }
    results[j,i+2]=sum(hits_by_query)/Number[j] 
  }
}

#Saves data frame
save(results,file="results.Rda")

#Returns all restriction enzymes that recognize COI barcodes of only one species
#Also returns the name of the species each enzyme recognizes, and the recogition site location
for(i in 1:nrow(enzyme.sites)){
  test_1=(sum(results[,i+2]==0))==(length(Species)-1)
  ref_1=vector(mode="numeric",length=nrow(vouchers))
  ref_2=vector(mode="numeric",length=nrow(vouchers))
  ref_3=vector(mode="numeric",length=2)
  if(test_1){
    print(as.character(enzyme.sites[i,1]))
    names_1=as.character(results[which(results[,i+2]>0,arr.ind=TRUE),1])
    print(names_1)
    location_1=which(vouchers==names_1)
    for(j in location_1){
      if(as.numeric(gregexpr(enzyme.sites[i,2],vouchers[j,2])[[1]])>0){
        ref_1[j]=as.numeric(gregexpr(enzyme.sites[i,2],vouchers[j,2])[[1]])
      }
      if(as.numeric(gregexpr(enzyme.sites[i,3],vouchers[j,2])[[1]])>0){
        ref_2[j]=as.numeric(gregexpr(enzyme.sites[i,3],vouchers[j,2])[[1]])
      }
    }
    ref_3[1]=max(ref_1)
    ref_3[2]=max(ref_2)
    print(max(ref_3))
  }
}

#Returns all restriction enzymes that have at least one cut site and the same number of recognition sites across all vouchers of each species (ie. recongition sites do not overlap SNPs)
#Also returns the name of all species each enzyme recognizes, and the recognition site location for each species in order as they appear
for(i in 1:nrow(enzyme.sites)){
  test_2=all(results[,i+2]==floor(results[,i+2]))
  test_3=all(results[,i+2]==0)
  if(test_2&!test_3){
    print(as.character(enzyme.sites[i,1]))
    names_2=as.character(results[which(results[,i+2]>0,arr.ind=TRUE),1])
    print(names_2)
    location_2=match(names_2,vouchers[,1])
    for(j in location_2){
      if(as.numeric(gregexpr(enzyme.sites[i,2],vouchers[j,2])[[1]])>0){
        print(as.numeric(gregexpr(enzyme.sites[i,2],vouchers[j,2])[[1]]))
      }
      if(as.numeric(gregexpr(enzyme.sites[i,3],vouchers[j,2])[[1]])>0){
        print(as.numeric(gregexpr(enzyme.sites[i,3],vouchers[j,2])[[1]])) 
      }
    }
  }
}
