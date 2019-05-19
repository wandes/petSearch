/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Wandes
 * Created: 18/05/2019
 */

SELECT u.cd_animal, u.cd_status_animal, u.nm_animal, u.nm_species_animal, u.nm_race, u.sg_gender_animal, u.nm_color, u.qt_age_animal, u.ds_comments FROM animal u right JOIN users_animal a ON u.cd_animal = a.cd_animal AND a.cd_user = 1;