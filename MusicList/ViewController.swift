//
//  ViewController.swift
//  MusicList
//
//  Created by Alivia Guin on 12/10/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var music = [Music]()
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func configureSongs() {
        music.append(Music(name: "Money Heist",
                           albumName: "Bella Ciao Male version",
                           artistName: "Mercelle",
                           imageName: "BellaCiao",
                           trackName: "MaleBellaCiao"))
        music.append(Music(name: "Money Heist",
                           albumName: "Bella Ciao Female version",
                           artistName: "Fernandes Torquitto",
                           imageName: "femaleBellaCiao",
                           trackName: "femaleBellaCiao"))
        music.append(Music(name: "Game Of Thrones Theme Song",
                           albumName: "Theme song",
                           artistName: "Nick Shaw",
                           imageName: "GOTtheme",
                           trackName: "themeSong"))
        music.append(Music(name: "Game Of Thrones House Of Targeryan",
                           albumName: "House Of Targeryan",
                           artistName: "Danearys Targeryan",
                           imageName: "targeryan",
                           trackName: "targeryan"))
        music.append(Music(name: "Game Of Thrones Title Song",
                           albumName: "Title song",
                           artistName: "Mark wood",
                           imageName: "GOTtitle",
                           trackName: "GOTtitlesong"))
        music.append(Music(name: "Game Of Thrones Valar Morghulis",
                           albumName: "GOT Arya Stark",
                           artistName: "Arya Stark",
                           imageName: "valarMorghulis",
                           trackName: "valarMorghulis"))
        music.append(Music(name: "Happy Go Lucky",
                           albumName: "Happy",
                           artistName: "Helena Dzisua",
                           imageName: "artist6",
                           trackName: "music6"))
        music.append(Music(name: "Dramatic Piano",
                           albumName: "Cheer Up",
                           artistName: "Some random2",
                           imageName: "artist5",
                           trackName: "music5"))
        music.append(Music(name: "Happy Go Lucky",
                           albumName: "Happy",
                           artistName: "Some random3",
                           imageName: "artist6",
                           trackName: "music6"))
        music.append(Music(name: "Spring Field",
                           albumName: "Farm Land",
                           artistName: "Adam Young",
                           imageName: "artist1",
                           trackName: "music1"))
        music.append(Music(name: "Cheer Up",
                           albumName: "Something",
                           artistName: "Taylor Swift",
                           imageName: "artist2",
                           trackName: "music2"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = music[indexPath.row]
        //configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.textLabel?.text = song.name
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 15)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 20)

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(identifier: "audio") as? AudioViewController else {
            return
        }
        vc.songs = music
        vc.position = position
        present(vc, animated: true)
    }


}

struct Music {
    let name : String
    let albumName : String
    let artistName : String
    let imageName : String
    let trackName : String
}

