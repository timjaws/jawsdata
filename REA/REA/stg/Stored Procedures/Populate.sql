

Create   Proc stg.Populate


as

drop table if exists stg.LoadDataStep1


select 
--top 10 JsonData, 
--homes.*
JSON_VALUE(homes.value, '$.mlsId.value') mlsId
,JSON_VALUE(homes.value, '$.price.value') price
,JSON_VALUE(homes.value, '$.hoa.value') hoa
,JSON_VALUE(homes.value, '$.sqFt.value') sqFt
,JSON_VALUE(homes.value, '$.pricePerSqFt.value') pricePerSqFt
,JSON_VALUE(homes.value, '$.lotSize.value') lotSize
,JSON_VALUE(homes.value, '$.beds') beds
,JSON_VALUE(homes.value, '$.baths') baths
,JSON_VALUE(homes.value, '$.fullBaths') fullBaths
,JSON_VALUE(homes.value, '$.location.value') location
,JSON_VALUE(homes.value, '$.stories.value') stories
,JSON_VALUE(homes.value, '$.latLong.value.latitude') latitude
,JSON_VALUE(homes.value, '$.latLong.value.longitude') longitude
,JSON_VALUE(homes.value, '$.streetLine.value') streetLine
,JSON_VALUE(homes.value, '$.unitNumber.value') unitNumber
,JSON_VALUE(homes.value, '$.city') city
,JSON_VALUE(homes.value, '$.state') state
,JSON_VALUE(homes.value, '$.zip') zip
,JSON_VALUE(homes.value, '$.postalCode.value') postalCode
,JSON_VALUE(homes.value, '$.countryCode') countryCode
,JSON_VALUE(homes.value, '$.showAddressOnMap') showAddressOnMap
,JSON_VALUE(homes.value, '$.soldDate') soldDate
,JSON_VALUE(homes.value, '$.searchStatus') searchStatus
,JSON_VALUE(homes.value, '$.propertyType') propertyType
,JSON_VALUE(homes.value, '$.uiPropertyType') uiPropertyType
,JSON_VALUE(homes.value, '$.listingType') listingType
,JSON_VALUE(homes.value, '$.propertyId') propertyId
,JSON_VALUE(homes.value, '$.listingId') listingId
,JSON_VALUE(homes.value, '$.dataSourceId') dataSourceId
,JSON_VALUE(homes.value, '$.marketId') marketId
,JSON_VALUE(homes.value, '$.yearBuilt.value') yearBuilt
,JSON_VALUE(homes.value, '$.timeOnRedfin.value') timeOnRedfin
,JSON_VALUE(homes.value, '$.timeZone') timeZone
,JSON_VALUE(homes.value, '$.primaryPhotoDisplayLevel') primaryPhotoDisplayLevel
,JSON_VALUE(homes.value, '$.photos.value') photos
,JSON_VALUE(homes.value, '$.listingCoBroker.isRedfin') listingCoBrokerIsRedfin
,JSON_VALUE(homes.value, '$.url') url
,JSON_VALUE(homes.value, '$.hasInsight') hasInsight
,JSON_VALUE(homes.value, '$.sashes') sashes
,JSON_VALUE(homes.value, '$.isHot') isHot
,JSON_VALUE(homes.value, '$.hasVirtualTour') hasVirtualTour
,JSON_VALUE(homes.value, '$.hasVideoTour') hasVideoTour
,JSON_VALUE(homes.value, '$.has3DTour') has3DTour
,JSON_VALUE(homes.value, '$.hasSelfTour') hasSelfTour
,JSON_VALUE(homes.value, '$.isRedfin') isRedfin
,JSON_VALUE(homes.value, '$.isNewConstruction') isNewConstruction
,JSON_VALUE(homes.value, '$.listingRemarks') listingRemarks
,JSON_VALUE(homes.value, '$.remarksAccessLevel') remarksAccessLevel
,JSON_VALUE(homes.value, '$.servicePolicyId') servicePolicyId
,JSON_VALUE(homes.value, '$.businessMarketId') businessMarketId
,JSON_VALUE(homes.value, '$.isShortlisted') isShortlisted
,JSON_VALUE(homes.value, '$.isViewedListing') isViewedListing


into stg.LoadDataStep1


from stg.LoadData ld
outer apply openjson(ld.JsonData, '$.data.payload.homes') homes 
where 
IsJson(ld.jsondata) <>0