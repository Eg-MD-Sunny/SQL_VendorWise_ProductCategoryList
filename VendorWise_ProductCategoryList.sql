--Category Wise all Perishable Vendor List & Product NameCategory

select distinct pv.id [PV ID],
	   pv.Name [Product],
	   pv.Deleted [Deleted],
	   pv.Published [Published],
       v.Id [VendorID],
       V.Name [VendorName],
	   (Case when pv.ShelfType = 5 Then 'Perishable' When pv.ShelfType = 9 Then 'Frozen Perishable' else Null end) Category

from ProductVariantVendorMapping pvvm
join ProductVariant pv on pv.Id = pvvm.ProductVariantId 
join Vendor v on v.Id = pvvm.VendorId 
join ProductVariantCategoryMapping pvcm on pvcm.ProductVariantId = pv.Id 
join Category c on c.Id = pvcm.CategoryId 

where pv.ShelfType in (5,9)



--Category Wise all Non Perishable Vendor List & Product NameCategory

select distinct pv.id [PV ID],
	   pv.Name [Product],
	   pv.Deleted [Deleted],
	   pv.Published [Published],
       v.Id [VendorID],
       V.Name [VendorName],
	   (Case when pv.ShelfType not in (5,9) Then 'Non Perishable' else Null end) Category

from ProductVariantVendorMapping pvvm
join ProductVariant pv on pv.Id = pvvm.ProductVariantId 
join Vendor v on v.Id = pvvm.VendorId 
join ProductVariantCategoryMapping pvcm on pvcm.ProductVariantId = pv.Id 
join Category c on c.Id = pvcm.CategoryId 

where pv.ShelfType not in (5,9)