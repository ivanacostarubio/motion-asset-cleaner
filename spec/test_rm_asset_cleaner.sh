copy_image(){
    cp ./support/logo.png ./resources/$1
}

it_filters_out_default_images(){
    assertEquals "" "`./rm_asset_cleaner`"
}

it_knows_there_are_some_unused_assets(){
    copy_image "crazy.png"
    copy_image "logo.png"
    assertEquals "./resources/crazy.png" "`./rm_asset_cleaner`"
    rm ./resources/crazy.png
    rm ./resources/logo.png
}

it_ignores_at_2x_when_present(){
    copy_image "unused_logo.png"
    copy_image "logo.png"
    copy_image "logo@2x.png"
    assertEquals "./resources/unused_logo.png" "`./rm_asset_cleaner`"
    rm ./resources/logo@2x.png
    rm ./resources/unused_logo.png
    rm ./resources/logo.png
}

it_detect_launch_images(){
  copy_image "Default.png"
  assertEquals "" "`./rm_asset_cleaner`"
  rm ./resources/Default.png
}

#it_detects_unused_at_2x_files(){
#    copy_image "not_used@2x.png"
#    assertEquals "./resources/not_used@2x.png" "`./rm_asset_cleaner`"
#    rm ./resources/not_used@2x.png
#}

#it_supports_interface_builder_files(){
    # TODO
#    echo 
#}

#it_supports_the_icons_files(){
    # TODO
#    echo 
#}

suite(){
    for test_name in `grep '^it' $0 | cut -d '(' -f 1`; do 
        suite_addTest $test_name
    done
}

. "./spec/shunit2-2.1.6/src/shunit2"

shuStart Suite
