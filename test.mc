@SceneChalau main {
    
   SabitRakho SadiGinti MIN_STOCK rakhle 100;
    SabitRakho PointWali UNIT_PRICE rakhle 5.5;
    
    SadiGinti current_stock rakhle 0;
    PointWali total_cost rakhle 0.0;
    SadiGinti attempts rakhle 0;
    
   dikhao<- "--- Inventory Reorder System ---";
    
    JitniDairTak (attempts kamHai 3) aur (current_stock kamHai 1) { 
        attempts rakhle attempts jama 1;
         dikhao<- "Attempt: ";
         dikhao<- attempts;
        dikhao<- " Enter current stock (1-500): ";
        pakro-> current_stock;
    }
    
  
    MaanLo (current_stock kamHai MIN_STOCK) {
        
    SadiGinti order_qty rakhle MIN_STOCK kaatDo current_stock;
        total_cost rakhle order_qty timesKaro UNIT_PRICE;
        
        dikhao<- "ORDER REQUIRED! Stock is ";
        dikhao<- current_stock;
       dikhao<- " units.";
       dikhao<- "Order ";
       dikhao<- order_qty;
       dikhao<- " units. Total cost will be ";
        dikhao<- total_cost;
    
    } ParAgar (current_stock sameTOsame MIN_STOCK) {
        
      dikhao<- "STOCK IS PERFECT. No order needed.";
    
}   
   WarnaYeh { 

        dikhao<- "STOCK IS HIGH. No order needed.";
    }
    
    DenaWapis 0; 
}
