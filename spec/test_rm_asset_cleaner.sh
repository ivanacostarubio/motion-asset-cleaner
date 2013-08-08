copy_image(){
    cp ./support/logo.png ./resources/$1
}

it_detects_the_files_in_a_project(){
    assertEquals "./app/app_delegate.rb
./app/onboarding_background_images.rb
./lib/motion-asset-cleaner.rb" "`./find_files_in_project.sh`"
}

it_filters_out_default_images(){
    assertEquals "" "`./rm_asset_cleaner`"
}

it_knows_there_are_some_unused_assets(){
    copy_image "unused_logo.png"
    assertEquals "./resources/unused_logo.png" "`./rm_asset_cleaner`"
    rm ./resources/unused_logo.png
}

it_knows_we_are_using_a_file_with_the_2x(){
    copy_image "unused_logo.png"
    copy_image "logo@2x.png"
    assertEquals "./resources/unused_logo.png" "`./rm_asset_cleaner`"
    rm ./resources/logo@2x.png
    rm ./resources/unused_logo.png
}


it_detects_unused_at_2x_files(){
    # TODO
    echo
}

it_detects_the_splash_image(){
    # TODO
    echo 
}

suite(){
    for test_name in `grep '^it' $0 | cut -d '(' -f 1`; do 
        suite_addTest $test_name
    done
}


. "./spec/shunit2-2.1.6/src/shunit2"

shuStart Suite
