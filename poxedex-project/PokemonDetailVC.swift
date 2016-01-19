//
//  PokemonDetailVC.swift
//  poxedex-project
//
//  Created by Carlos Acosta on 1/17/16.
//  Copyright © 2016 Carlos Acosta. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var poke: Pokemon!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var evoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nameLabel.text = poke.name.capitalizedString
        var image = UIImage(named: "\(poke.pokedexId)")
        mainImage.image = image
        currentEvoImage.image = image
        print(poke.name.capitalizedString)
        
        
        
        
        poke.downloadPokemonDetails { () -> () in
            //called after downloading is called
            self.updateUI()
            
        }
    }
    
    func updateUI(){
        descriptionLabel.text = poke.description
        typeLabel.text = poke.type
        defenseLabel.text = poke.defense
        heightLabel.text = poke.height
        pokedexLabel.text = "\(poke.pokedexId)"
        weightLabel.text = poke.weight
        baseAttackLabel.text = poke.attack
        
        if poke.nextEvolutionId == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImage.hidden = true
        } else {
            nextEvoImage.hidden = false
            nextEvoImage.image = UIImage(named: poke.nextEvolutionId)
            var str = "Next Evolution: \(poke.nextEvolutionText)"
            
            if poke.nextEvolutionLevel != "" {
                str += " - LVL \(poke.nextEvolutionLevel)"
            }
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
