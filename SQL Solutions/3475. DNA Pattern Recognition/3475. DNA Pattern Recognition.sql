select sample_id,dna_sequence,species,
SUM(CASE WHEN dna_sequence like 'ATG%' THEN 1 else 0 end) as has_start,
SUM(CASE WHEN dna_sequence like '%TAA'  or dna_sequence like '%TAG' 
or dna_sequence like '%TGA' 
THEN 1 else 0 end) as has_stop,
SUM(CASE WHEN dna_sequence like '%ATAT%' THEN 1 else 0 end) as has_atat,
SUM(CASE WHEN dna_sequence like '%GGG%' THEN 1 else 0 end) as has_ggg
from samples
group by 1,2,3
order by 1;