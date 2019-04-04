World(Helper)

#Depois de cada cenário tirar um print e remove todos os espaços e virgulas.
After do |scenario|
    scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    scenario_name = scenario_name.delete(',', '')
    scenario_name = scenario_name.delete('(', '')
    scenario_name = scenario_name.delete(')', '')
    scenario_name = scenario_name.delete('#', '')

    if scenario.failed?
        sleep 1
        take_screenshot(scenario_name.downcase!, 'falhou')
    else
        sleep 1
        take_screenshot(scenario_name.downcase!, 'passou')
    end
end

