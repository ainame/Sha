# -*- coding: utf-8 -*-
class ShaListViewController < UIViewController
  extend IB
  attr_accessor :tableView
  ib_outlet :tableView, UITableView
  CELL_IDENTIFIER = 'user_list_cell'

  def viewDidLoad
    super
    UIApplication.sharedApplication.setStatusBarHidden(true)
  end

  def numberOfSectionsInTableView
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    100
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: CELL_IDENTIFIER)
    cell.textLabel.text = ['ainame', 'ozyozyo', 'nifuramu', 'ypresto', 'radioboo', 'sobataro', 'nao', 'kenji'].sample
    cell.textLabel.textColor = '#ffffff'.uicolor
    #cell.textLabel.font = UIFont.fontWithName('Montserrat', size: 60.0)
    cell.backgroundColor = YoColors.get_by_row(indexPath.row)
    cell.selectionStyle = UITableViewCellSelectionStyleNone
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    didTapNickname(tableView)
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    80.0
  end

  def didTapNickname(sender)
    VoicePlayer.run
  end
end

class VoicePlayer
  def initialize
    @sound_id = Pointer.new('I')
    AudioServicesCreateSystemSoundID(NSURL.fileURLWithPath(path), @sound_id)
  end

  def self.run
    new.play
  end

  def play
    p 'しゃーなしやで'
    AudioServicesPlaySystemSound(@sound_id[0])
  end

  private
  def url
    NSURL.fileURLWithPath(path)
  end

  def path
    NSBundle.mainBundle.pathForResource("voice", ofType:"wav")
  end
end

class YoColors
  class << self
    LIST = ['#EB4C3D', '#1BBC9B', '#2DCC70', '#3598DB', '#34495E', '#16A086', '#F1C40F', '#287FB8', '#8D44AD'].map(&:uicolor)

    def sample
      LIST.sample
    end

    def get_by_row(row)
      LIST[row % LIST.size]
    end
  end
end
