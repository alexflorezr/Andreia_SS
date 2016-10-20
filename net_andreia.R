### Plots a haplotype network using all populations
net_andreia <- function(pop_nex){
require(pegas)
temp_hap <- haplotype(pop_nex)
sort(temp_hap, what = "label")
ind.hap <- with(
        stack(setNames(attr(temp_hap, "index"), rownames(temp_hap))),
        table(hap=ind, pop=str_sub(labels(pop_nex), -1)[values]))
temp_hapNet <- haploNet(temp_hap)
plot(temp_hapNet, size=sqrt(attr(temp_hapNet, "freq")), show.mutation=F, pie=ind.hap,
     scale.ratio=10,labels=F)
legend(7, -20, colnames(ind.hap), col=rainbow(ncol(ind.hap)), pch=19, ncol=2, title = "Pop")
}
net_andreia(pop_nex)
 