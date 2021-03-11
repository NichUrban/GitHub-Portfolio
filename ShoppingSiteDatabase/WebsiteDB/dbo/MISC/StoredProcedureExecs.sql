--------------------------------------------------------------------------
-- First make sure the publish profile has published successfully.		--
-- (The publish profile can be found in solution explorer under			--
-- 'PublishLocations' folder).											--
-- Navigate to SQLServerObjectExplorer under "view" tab and find		--
-- 'ShoppingWebsiteDB'													--
-- Right click on the 'ShoppingWebsiteDB' and click "New Query..."		--
-- Copy & paste each one of these (separately) in the new query window. -- 
-- Hit run to see these each of these stored procedures in action.		--
--------------------------------------------------------------------------

--
exec dbo.spEmployeeShopper_AddNewEmployee 'New', 'CoWorker', '555-555-5555'

--
exec dbo.spAllProductsBasicInfo_FilterByPrice 5, 15

--
exec dbo.spMemberShopper_FillterByLastName 'Wilson'