SELECT assets0_.notification_config_assets_id AS notifica1_6_0_, 
       assets0_.asset_id                      AS asset_id2_7_0_, 
       asset1_.id                             AS id1_1_1_, 
       asset1_.version                        AS version2_1_1_, 
       asset1_.created_at                     AS created_3_1_1_, 
       asset1_.created_by                     AS created_4_1_1_, 
       asset1_.TYPE                           AS type5_1_1_, 
       asset1_.updated_at                     AS updated_6_1_1_, 
       asset1_.updated_by                     AS updated_7_1_1_, 
       asset1_.emei                           AS emei1_5_1_, 
       asset1_.imo                            AS imo1_16_1_, 
       asset1_.mmsi                           AS mmsi2_16_1_, 
       asset1_.clazz_                         AS clazz_1_ 
FROM   notification_config_asset assets0_ 
       inner join (SELECT id, 
                          version, 
                          created_at, 
                          created_by, 
                          TYPE, 
                          updated_at, 
                          updated_by, 
                          emei, 
                          NULL :: VARCHAR AS imo, 
                          NULL :: VARCHAR AS mmsi, 
                          1               AS clazz_ 
                   FROM   mobile_device 
                   UNION ALL 
                   SELECT id, 
                          version, 
                          created_at, 
                          created_by, 
                          TYPE, 
                          updated_at, 
                          updated_by, 
                          NULL :: VARCHAR AS emei, 
                          imo, 
                          mmsi, 
                          2               AS clazz_ 
                   FROM   vessel) asset1_ 
               ON assets0_.asset_id = asset1_.id 
WHERE  assets0_.notification_config_assets_id =? 
